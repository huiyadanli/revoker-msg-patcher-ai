## 微信 PC 4.x（Weixin.dll）反撤回 Patch 记录

> 版本：Weixin 4.2.0.13（`WeChatWin_4.2.0.exe`，2026-11-05 发布，`4.2.0.13/Weixin.dll`）
>
> 参考实现：`微信PC4_1_12_55_反撤回_Patch记录.md`（4.1.12.55，实测有效）及 4.1.7.30 / 4.1.9.30
>
> 目标效果：**他人撤回消息后，原消息内容仍保留在界面上**（撤回提示不显示，内容原样保留）
>
> 修改方式：**单点字节级 Patch**（newmsgid 篡改，1 字节），与 4.1.12.55 同一逻辑

---

## 〇、最终结论（静态验证，未实机测试）

**只需一个 Patch：篡改撤回通知中的 newmsgid（新消息 ID），使撤回执行查找原消息失败。**

```
mov qword ptr [rsi+0x248], rax    →    sub qword ptr [rsi+0x248], rax

（newmsgid = 解析值）                  （newmsgid -= 解析值 → 错误 ID）
```

**原理**：收到他人撤回通知（revokemsg sysmsg）时，客户端解析出 `newmsgid`（被撤回的原消息 ID），然后按该 ID 查找本地消息并替换/删除其内容。若把 `mov`（赋值）改成 `sub`（累减），存进对象的 newmsgid 变成错误值，撤回执行找不到原消息 → 原消息内容原样保留在界面上。

> ⚠️ 验证范围说明：本版本结论为**静态验证**，未在 Windows 上实机测试。本机为 Linux VM，无法安装/运行 Windows 版微信，故未做“替换 DLL 后实际撤回”的实测。静态证据与 4.1.12.55（实测有效）完全同构：同一特征码全文件唯一命中、同一函数、同一字段偏移（0x248）、同一调用序列。实机测试需在 Windows 上替换 DLL 后验证，见“注意事项”。

---

## 一、Patch 点位（4.2.0.13）

| 文件偏移 | VA | 原字节 | 修改后 | 说明 |
| --- | --- | --- | --- | --- |
| `0x23B69ED` | `0x1823B75ED` | `48 89 86 48 02 00 00` | `48 29 86 48 02 00 00` | `mov [rsi+0x248],rax` → `sub [rsi+0x248],rax`（篡改 newmsgid） |

- 换算：`.text` 段 RVA 0x1000 → 文件偏移 0x400；`文件偏移 = 0x400 + (VA - 0x180001000)`。ImageBase 为 `0x180000000`。
- `sub` 编码：只把第 2 字节 `89`→`29`（`48 89 86`→`48 29 86`），**REX.W 前缀 `48` 与后续 disp 不变**，全文件仅 1 字节差异。
- 反汇编验证（capstone 5.0.7）：`sub qword ptr [rsi + 0x248], rax`
- 原始文件：`Weixin.dll`（205,943,848 字节，SHA256 `afe3d02c58bada3c35009c0cd58ee1f57b2a00fe53237d0dce649107fddb9a20`）
- Patch 后文件：`Weixin.dll.patched-4.2.0.13-revoke`（SHA256 `b12162609ae2bf7a3fcdf822bb77c01d26d9cd21e7a5afb1c21a913328a7bad3`，与原始仅偏移 `0x23B69EE` 一字节不同）

---

## 二、所属函数与上下文

Patch 在 **`sub_1823B6E40`**（revokemsg sysmsg 通知解析器，VA 0x1823B6E40，大小 0xC4A，680 条指令；函数边界取自 PE `.pdata`，RVA 0x23B6E40–0x23B7A8A）：

```
lea r8, "newmsgid"                       ; 0x1823B75B0 -> 0x1893A6A28 ("newmsgid")
lea rcx, [rbp+0x210]; lea rdx, [rbp+0x200]
call 0x18066FF20                          ; 取 newmsgid 字段
lea rcx, [rbp+0x200]
call 0x180227090                          ; 字段存在?
test al, al
jne  0x1823B6F37                           ; 不存在则跳过
mov rcx, [rbp+0x200]                      ; newmsgid 字符串
call 0x18067AB70                          ; 字符串→数字（4.1.12.55 为 sub_180F8ADD0）
nop
mov [rsi+0x248], rax                      ; ★ newmsgid = 解析值 → sub（patch 后）
mov [rbp+0x208], r13
lea r8, "replacemsg"                      ; 下一字段
```

对应汇编（patch 处 VA 0x1823B75ED，前后上下文，capstone 实测）：

```
1823B75B0: lea r8, [rip+0x6fef471]    ; "newmsgid"
1823B75B7: lea rcx, [rbp+0x210]
1823B75BE: lea rdx, [rbp+0x200]
1823B75C5: call 0x18066ff20
1823B75CA: nop
1823B75CB: lea rcx, [rbp+0x200]
1823B75D2: call 0x180227090
1823B75D7: nop
1823B75D8: test al, al
1823B75DA: jne 0x1823b6f37
1823B75E0: mov rcx, [rbp+0x200]
1823B75E7: call 0x18067ab70           ; 字符串→数字
1823B75EC: nop
1823B75ED: mov [rsi+0x248], rax       ; ★ newmsgid → sub（patch 后）
1823B75F4: mov [rbp+0x208], r13
1823B75FB: lea r8, [rip+0x71944be]    ; "replacemsg"
```

- `rsi + 0x248`：newmsgid 字段（后续撤回执行用它查找原消息）。
- 该函数内引用到的撤回相关字符串（lea rip-relative 目标，实测）：
  - `revokemsg`（0x1891AD9A8，0x1823B7085）
  - `revoke_climsgid`（0x18954BAD0，0x1823B7216）
  - `replacemsg`（0x18954BAC0，0x1823B727B / 0x1823B75FB）
  - `revoketime`（0x18954BAB0，0x1823B7506）
  - `newmsgid`（0x1893A6A28，0x1823B75B0；另有同名字符串位于 0x1890783DC、0x1891AD9A8 附近区域，本函数用的是 0x1893A6A28 这一处）
  - 另有 `0x18954BAE0 / 0x18954BAF8 / 0x18954BB10 / 0x18954BE60 / 0x18954BEC8 / 0x18954BF08 / 0x18954BF38` 等相邻字段串（session / chat_id 等同区字符串）。

---

## 三、参考版本的对应关系

| 版本 | 文件偏移 | VA | 指令 | 所属函数 |
| --- | --- | --- | --- | --- |
| 4.1.7.30 | `0x1FC9DBD` | — | `mov/sub [rsi+0x1A8],rax` | 处理 revokemsg sysmsg 的函数 |
| 4.1.9.30 | `0x021CC15D` | — | `mov/sub [rsi+0x1C8],rax` | `sub_1821CC5C0` |
| 4.1.12.55 | `0x23622CD` | `0x182362ECD` | `mov/sub [rsi+0x248],rax` | `sub_182362720` |
| **4.2.0.13** | **`0x23B69ED`** | **`0x1823B75ED`** | **`mov/sub [rsi+0x248],rax`** | **`sub_1823B6E40`** |

- 四者是**同一逻辑**：把 `call <字符串→数字>; nop; mov [obj+newmsgid偏移], rax` 改成 `sub`。
- 字段偏移：0x1A8 → 0x1C8 → 0x248 → **0x248（4.1.12.55 到 4.2.0.13 未变）**。
- 函数地址随版本漂移（0x182362720 → 0x1823B6E40），字符串→数字函数地址也漂移（0x180F8ADD0 → 0x18067AB70），但指令模式与字段偏移不变。

---

## 四、定位方法（本版本实测复现）

1. 在 `Weixin.dll` 全文件搜通配特征码（4.1.12.55 记录给出，3 个版本唯一命中）：
   ```
   Search  = 48 89 86 ?? ?? ?? ?? 4C 89 AD 08 02 00 00 4C 8D 05
   Replace = 48 29 86 ?? ?? ?? ?? 4C 89 AD 08 02 00 00 4C 8D 05
   ```
   在 4.2.0.13 全文件**唯一命中 1 处**：文件偏移 `0x23B69ED`，disp 为 `48 02 00 00`（0x248）。
2. 交叉验证：另搜 `8B 8D 00 02 00 00 E8 ?? ?? ?? ?? 90 48 89 86`（`mov rcx,[rbp+0x200]; call; nop; mov [rsi+...],rax`），同样**唯一命中 1 处**，文件偏移 `0x23B69E1`，与上一处相差 0xC（即 patch 指令前 12 字节），互相印证。
3. 上下文验证：用 capstone 反汇编 patch 前后，确认 `call <字符串→数字>; nop; mov [rsi+0x248],rax; mov [rbp+0x208],r13; lea r8,"replacemsg"` 序列完整；用 PE `.pdata` 定出所属函数 `sub_1823B6E40`，函数内 lea 引用到 `revokemsg / newmsgid / replacemsg / revoke_climsgid / revoketime`。
4. 把 `mov [rsi+0x248],rax` 改成 `sub [rsi+0x248],rax`（只改 `89`→`29`）。
5. 用 capstone 反汇编验证指令完整：`sub qword ptr [rsi + 0x248], rax`；核对全文件仅 1 字节差异。

> 说明：本版本未对 `Weixin.dll`（197 MB）做全量 Ghidra 反编译（本机可用内存约 800 MB，全量分析过重）。上述验证用的是字节特征搜索 + capstone 定向反汇编 + `.pdata` 函数边界 + 字符串引用交叉验证，与 4.1.12.55 记录中的“纯 IDA / 字节搜索定位”方法一致。

---

## 五、实施脚本（可复现 / 可回滚）

```
import hashlib

path = r"E:\Program Files\Tencent\Weixin\4.2.0.13\Weixin.dll"

# ── 打 patch ──────────────────────────────────────────────
data = bytearray(open(path, "rb").read())

off = 0x23B69ED
old = bytes.fromhex("48 89 86 48 02 00 00")   # mov [rsi+0x248],rax
new = bytes.fromhex("48 29 86 48 02 00 00")   # sub [rsi+0x248],rax

assert bytes(data[off:off+len(old)]) == old, f"mismatch: {bytes(data[off:off+7]).hex()}"
data[off:off+len(new)] = new
open(path, "wb").write(bytes(data))

# ── 回滚（恢复原始 mov）─────────────────────────────────────
# data[off:off+len(old)] = old

print("SHA256:", hashlib.sha256(bytes(data)).hexdigest())
# 预期 Patch 后 SHA256: b12162609ae2bf7a3fcdf822bb77c01d26d9cd21e7a5afb1c21a913328a7bad3
```

- 原始文件 SHA256：`afe3d02c58bada3c35009c0cd58ee1f57b2a00fe53237d0dce649107fddb9a20`（205,943,848 字节）
- 安装包：`WeChatWin_4.2.0.exe`（248 MB，SHA256 `fce15d1659d2ff4e1fbc3abe8704160d3e9376b88ef2e832961f8274bec4406c`，2026-11-05 发布，官网 https://pc.weixin.qq.com/ → https://windows.weixin.qq.com/）
- 原始备份：替换前务必 `copy Weixin.dll Weixin.dll.bak`

---

## 六、注意事项

- 修改前务必备份：`copy Weixin.dll Weixin.dll.bak`
- **测试前必须完全退出微信**（任务管理器结束所有 `Weixin.exe`），再替换 DLL。
- 效果（按 4.1.12.55 实测推断，4.2.0.13 待实机验证）：内容原样保留，**撤回提示也不显示**。
- 若需“内容保留 + 撤回提示仍显示”，需另做：保留提示插入、仅阻断原消息替换（当前未实现，可后续研究撤回提示渲染路径）。
- 本版本未发现 DLL 完整性/签名校验（静态观察，未实测）。
- 与 3.9 分支的区别：3.9.12.57 的主 DLL 是 `WeChatWin.dll`（97 MB），整个包里没有 `Weixin.dll`；`Weixin.dll` 是 4.x 分支的主 DLL，不要拿 3.9 的偏移往 4.x 上套。

---

## 七、与 4.1.12.55 的差异小结

- Patch 逻辑、字段偏移（0x248）、特征码锚点（`mov [rbp+0x208],r13` + `lea r8`）**全部未变**，4.2.0.13 可直接沿用 4.1.12.55 的方法。
- 变的只有地址：所属函数 `0x182362720` → `0x1823B6E40`，Patch 点 `0x182362ECD` → `0x1823B75ED`，文件偏移 `0x23622CD` → `0x23B69ED`，字符串→数字函数 `0x180F8ADD0` → `0x18067AB70`。
- 4.1.12.55 记录中的失败教训（清空 content NOP、撤回提示构造函数的 jz→jmp、撤回核心 jz→jmp 单独无效）在本版本未重复尝试，沿用已验证的 newmsgid 单点方案。
