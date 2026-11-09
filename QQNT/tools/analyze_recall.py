"""Read-only QQNT recall research: PE strings, RIP LEA xrefs and unwind ranges.

No target execution, patching, debugger attachment or chat database access.
Requires pefile and capstone. All output is UTF-8 without BOM.
"""

import argparse
import bisect
import ctypes
from ctypes import wintypes
import hashlib
import json
from pathlib import Path
import re
import struct

import capstone
import pefile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("target", type=Path)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--pid", type=int)
    parser.add_argument("--module-base", type=lambda s: int(s, 0))
    args = parser.parse_args()
    if bool(args.pid) != bool(args.module_base):
        parser.error("--pid and --module-base must be supplied together")
    args.out.mkdir(parents=True, exist_ok=True)
    data = args.target.read_bytes()
    pe = pefile.PE(data=data, fast_load=True)
    base = pe.OPTIONAL_HEADER.ImageBase
    package_path = args.target.parent / "package.json"
    qq_version = None
    if package_path.is_file():
        try:
            qq_version = json.loads(package_path.read_text(encoding="utf-8-sig")).get("version")
        except (ValueError, OSError):
            pass
    pe.parse_data_directories(directories=[pefile.DIRECTORY_ENTRY["IMAGE_DIRECTORY_ENTRY_RESOURCE"]])
    fixed_version = getattr(pe, "VS_FIXEDFILEINFO", [])
    wrapper_file_version = None
    if fixed_version:
        version = fixed_version[0]
        wrapper_file_version = ".".join(str(value) for value in (
            version.FileVersionMS >> 16, version.FileVersionMS & 0xFFFF,
            version.FileVersionLS >> 16, version.FileVersionLS & 0xFFFF))
    sections = [{"name": s.Name.rstrip(b"\0").decode("ascii"),
                 "rva": hex(s.VirtualAddress), "virtual_size": s.Misc_VirtualSize,
                 "raw_offset": hex(s.PointerToRawData), "raw_size": s.SizeOfRawData}
                for s in pe.sections]
    exc = pe.OPTIONAL_HEADER.DATA_DIRECTORY[3]
    exc_off = pe.get_offset_from_rva(exc.VirtualAddress)
    ranges = [struct.unpack_from("<III", data, o)
              for o in range(exc_off, exc_off + exc.Size - 11, 12)]
    ranges.sort()
    starts = [r[0] for r in ranges]

    def owner(va):
        i = bisect.bisect_right(starts, va - base) - 1
        if i >= 0 and ranges[i][0] <= va - base < ranges[i][1]:
            return ranges[i]
        return None

    keywords = [b"[Msg] on grp recall", b"[Msg] on c2c recall",
                b"msg_recall_worker.cc", b"HandleRecallSysMsg",
                b"HandleRecallMsgNotify", b"FillRecallInfoToMsgNotifyInAndrSilence",
                b"on recall group", b"on recall c2c", b"fill recall info:"]
    strings = []
    for keyword in keywords:
        for match in re.finditer(re.escape(keyword), data):
            start = data.rfind(b"\0", max(0, match.start() - 200), match.start()) + 1
            end = data.find(b"\0", match.start())
            if end < 0:
                continue
            try:
                va = base + pe.get_rva_from_offset(start)
            except pefile.PEFormatError:
                continue
            if any(s["va"] == hex(va) for s in strings):
                continue
            strings.append({"keyword": keyword.decode(), "file_offset": hex(start),
                            "va": hex(va), "text": data[start:end].decode("utf-8", "replace"),
                            "lea_xrefs": []})
    wanted = {int(s["va"], 16): s for s in strings}
    # Candidate scan is deliberately limited to 7-byte REX.W LEA reg,[RIP+disp32].
    # Capstone verifies each candidate; this is not a complete code/data xref inventory.
    md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    md.detail = True
    function_ranges = {}
    for section in pe.sections:
        if not section.Characteristics & 0x20000000:
            continue
        code = data[section.PointerToRawData:section.PointerToRawData + section.SizeOfRawData]
        for match in re.finditer(rb"[\x48-\x4f]\x8d[\x05\x0d\x15\x1d\x25\x2d\x35\x3d]....", code, re.DOTALL):
            rva = section.VirtualAddress + match.start()
            va = base + rva
            dest = va + 7 + struct.unpack_from("<i", match.group(), 3)[0]
            if dest not in wanted:
                continue
            ins = next(md.disasm(match.group(), va), None)
            if not ins or ins.mnemonic != "lea" or not any(
                    op.type == capstone.x86.X86_OP_MEM and op.mem.base == capstone.x86.X86_REG_RIP
                    for op in ins.operands):
                continue
            bound = owner(va)
            wanted[dest]["lea_xrefs"].append({"va": hex(va), "instruction": f"{ins.mnemonic} {ins.op_str}",
                "pdata_start": hex(base + bound[0]) if bound else None,
                "pdata_end": hex(base + bound[1]) if bound else None})
            # Dump only directly relevant receive handlers and their named downstream helpers.
            if bound and wanted[dest]["keyword"] not in ("msg_recall_worker.cc", "HandleRecallSysMsg"):
                function_ranges[bound[0]] = bound

    functions = []
    process = None
    kernel = None
    if args.pid:
        kernel = ctypes.WinDLL("kernel32", use_last_error=True)
        kernel.OpenProcess.argtypes = [wintypes.DWORD, wintypes.BOOL, wintypes.DWORD]
        kernel.OpenProcess.restype = wintypes.HANDLE
        kernel.ReadProcessMemory.argtypes = [wintypes.HANDLE, ctypes.c_void_p, ctypes.c_void_p,
                                            ctypes.c_size_t, ctypes.POINTER(ctypes.c_size_t)]
        kernel.ReadProcessMemory.restype = wintypes.BOOL
        kernel.CloseHandle.argtypes = [wintypes.HANDLE]
        kernel.CloseHandle.restype = wintypes.BOOL
        process = kernel.OpenProcess(0x10, False, args.pid)  # PROCESS_VM_READ only
        if not process:
            raise ctypes.WinError(ctypes.get_last_error())
    try:
        for start, end, unwind in sorted(function_ranges.values()):
            va = base + start
            off = pe.get_offset_from_rva(start)
            code = data[off:off + end - start]
            lines = [f"; pdata range {hex(va)} .. {hex(base + end)} (exclusive)",
                     "; PE unwind range; not necessarily an entire source-level function."]
            decoded = list(md.disasm(code, va))
            for ins in decoded:
                annotation = ""
                for op in ins.operands:
                    if op.type == capstone.x86.X86_OP_MEM and op.mem.base == capstone.x86.X86_REG_RIP:
                        target = ins.address + ins.size + op.mem.disp
                        if target in wanted:
                            annotation = " ; " + wanted[target]["text"]
                lines.append(f"{ins.address:016X}  {ins.bytes.hex(' '):<30} {ins.mnemonic:<8} {ins.op_str}{annotation}")
            file_name = f"function_{va:X}.asm"
            (args.out / file_name).write_text("\n".join(lines) + "\n", encoding="utf-8")
            item = {"va": hex(va), "end": hex(base + end), "file_offset": hex(off),
                    "size": len(code), "decoded_bytes": sum(i.size for i in decoded),
                    "instruction_count": len(decoded), "asm_file": file_name}
            if process:
                buffer = ctypes.create_string_buffer(len(code))
                count = ctypes.c_size_t()
                address = args.module_base + start
                ok = kernel.ReadProcessMemory(process, ctypes.c_void_p(address), buffer, len(code), ctypes.byref(count))
                if not ok:
                    item["runtime"] = {"address": hex(address), "error": ctypes.get_last_error()}
                else:
                    observed = buffer.raw[:count.value]
                    # PE relocations can change bytes in other builds; no normalization is performed.
                    item["runtime"] = {"address": hex(address), "bytes_read": count.value,
                        "equals_disk": observed == code,
                        "sha256": hashlib.sha256(observed).hexdigest(),
                        "disk_sha256": hashlib.sha256(code).hexdigest(),
                        "differing_offsets": [hex(i) for i, (a, b) in enumerate(zip(observed, code)) if a != b]}
            functions.append(item)
    finally:
        if process:
            kernel.CloseHandle(process)
    result = {"qq_version": qq_version, "wrapper_file_version": wrapper_file_version,
              "target": str(args.target.resolve()), "sha256": hashlib.sha256(data).hexdigest(),
              "bytes": len(data), "machine": hex(pe.FILE_HEADER.Machine), "image_base": hex(base),
              "sections": sections, "pdata_entries": len(ranges),
              "strings": strings, "functions": functions,
              "runtime_pid": args.pid, "runtime_module_base": hex(args.module_base) if args.module_base else None,
              "limitations": ["Read-only static evidence plus optional scoped ReadProcessMemory.",
                              "RIP LEA candidate scan only; no exhaustive xrefs or decompilation.",
                              "No controlled recall event or functional patch test was performed."]}
    (args.out / "evidence.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"sha256": result["sha256"], "strings": len(strings), "functions": functions}, indent=2))


if __name__ == "__main__":
    main()
