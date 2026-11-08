## QQNT 9.9.37（wrapper.node）反撤回 Patch 记录

> 版本：QQ Windows 9.9.37（`QQ_9.9.37_261103_x64_01.exe`，2026-11-03 发布，版本号 `9.9.37-54395`）
>
> 参考原理：NapCat《NTQQ 防撤回原理》（https://napneko.github.io/other/ntrecall ，基于 NTQQ 34740，x64dbg + IDA）：目标文件 `wrapper.node`，在 Strings 视图中找到 `[Msg] on grp recall`（群聊）与 `[Msg] on c2c recall`（私聊）日志字符串，交叉引用到撤回处理函数，在其中把一处条件跳转反转（jnbe→jbe）即可使撤回失效
>
> 目标效果：**他人撤回消息后，原消息内容仍保留在界面上**（私聊与群聊各一处 Patch）
>
> 修改方式：**两处单字节 Patch**（条件跳转反转，各 1 字节，共 2 字节）

---

## 〇、最终结论（静态验证，未实机测试）

**群聊与私聊各需一个 Patch：**

```text
群聊 sub_1827754AE：
  cmp rax, 7 ; ja 0x1827756c2    →    cmp rax, 7 ; jbe 0x1827756c2
  （字段长度 > 7 才进入撤回处理）      （长度 > 7 时不再进入撤回处理）

私聊 sub_182771FB6：
  cmp rax, [rbp+0x1a0] ; je 0x182772135    →    cmp rax, [rbp+0x1a0] ; jne 0x182772135
  （消息列表为空才跳过处理）                  （消息列表非空时跳过处理）
```

**原理**：收到他人撤回通知时，客户端在 `msg_recall_worker` 模块（`msg_recall_worker.cc`，日志标签 `HandleRecallSysMsg`）的两个处理函数中解析撤回消息并执行删除/替换。群聊处理函数中有一处长度判断（字段长度 > 7 才进入撤回处理，与 NapCat 在 NTQQ 34740 上实测有效的 `jnbe→jbe` 点位同构）；私聊处理函数中没有这处 `cmp 7` 判断，改为反转消息列表为空判断，使正常（非空）撤回消息直接走“记录日志后退出”分支，撤回处理不再执行。

> ⚠️ 验证范围说明：本版本结论为**静态验证**，未在 Windows 上实机测试。本机为 Linux VM，无法安装/运行 Windows 版 QQNT，故未做“替换 wrapper.node 后实际撤回”的实测。静态证据与 NapCat 文档（NTQQ 34740，实测有效）同构：同一日志字符串全文件唯一引用、同一模块（`msg_recall_worker.cc`）、群聊点位与文档点位结构完全相同（`cmp len,7; ja` + 目标处 `add rdx,7` 跳过 7 字节前缀）。实机测试需在 Windows 上替换 `wrapper.node` 后验证，见“注意事项”。

---

## 一、Patch 点位（9.9.37）

| # | 文件偏移 | VA | 原字节 | 修改后 | 说明 |
| --- | --- | --- | --- | --- | --- |
| 1（群聊） | `0x2774980` | `0x182775580` | `0F 87 3C 01 00 00` | `0F 86 3C 01 00 00` | `ja 0x1827756c2` → `jbe 0x1827756c2`（只改第 2 字节 `87`→`86`，文件偏移 `0x2774981`） |
| 2（私聊） | `0x277144E` | `0x18277204E` | `0F 84 E1 00 00 00` | `0F 85 E1 00 00 00` | `je 0x182772135` → `jne 0x182772135`（只改第 2 字节 `84`→`85`，文件偏移 `0x277144F`） |

- 换算：`.text` 段 RVA 0x1000 → 文件偏移 0x400；`文件偏移 = 0x400 + (VA - 0x180001000)`。ImageBase 为 `0x180000000`。
- 反汇编验证（capstone 5.0.7）：Patch 后 `0x182775580` 为 `jbe 0x1827756c2`，`0x18277204E` 为 `jne 0x182772135`。
- 原始文件：`versions/9.9.37-54395/resources/app/wrapper.node`（118,186,536 字节，SHA256 `fed532ad58d2404dcedf2858554e8fa52a5f4e65b271c008d2faca4011d7d4a2`）
- Patch 后文件：`wrapper.node.patched-9.9.37-recall`（SHA256 `f5b33af07dcc7053914cf8d0994a280d3fc10f3b945d9f6e25bbd158fc1ad0fc`，与原始仅偏移 `0x277144F` 与 `0x2774981` 两字节不同）

---

## 二、所属函数与上下文

### 2.1 群聊：`sub_1827754AE`

群聊撤回处理函数（VA 0x1827754AE，大小 0x9E2，566 条指令；函数边界取自 PE `.pdata`，RVA 0x27754AE–0x2775E90）。日志字符串 `"[Msg] on grp recall nfy ! frm:{} to:{}, pr:{} seq:{} rd:{} t:{} op_uid:{} op_t:{} is_off:{} trl_flag:{} is_andr_silence:{}"`（VA 0x184833B6F）在全文件仅被此处引用一次（0x182775D6B）。

```text
182775568: mov rdx, [rbp+0x148]      ; 字段 2 字符串首指针
18277556F: mov r8,  [rbp+0x150]      ; 字段 2 字符串尾指针
182775576: mov rax, r8
182775579: sub rax, rdx              ; rax = 字符串长度
18277557C: cmp rax, 7
182775580: ja  0x1827756c2           ; ★ 长度 > 7 才进入撤回处理 → jbe（patch 后）
182775586: ...                      ; 长度 ≤ 7：记录日志后退出（不处理撤回）

1827756C2: add rdx, 7               ; 跳过 7 字节前缀
1827756C6: lea rcx, [rbp+0x130]
1827756CD: call 0x18000334a         ; 字符串赋值
1827756D2: ...                      ; 继续解析并处理撤回
182775C5E: ... call 0x182772b32     ; 填充撤回信息（与私聊共用）
182775D6B: lea rax, "[Msg] on grp recall nfy ! ..."   ; 记录群聊撤回日志
182775D93: call 0x182776260         ; 日志输出
```

与 NapCat 文档（NTQQ 34740）完全同构：文档伪代码为 `if (v54[1] - v54[0] > 7uLL) { sub_18001D478(v53, v54[0] + 7LL); ... }`，即“长度 > 7 时取从偏移 7 开始的子串并继续处理”，文档实测把该处 `jnbe` 改为 `jbe` 后撤回失效。本版本同一位置、同一判断、同一 `+7` 跳前缀结构。

### 2.2 私聊：`sub_182771FB6`

私聊撤回处理函数（VA 0x182771FB6，大小 0x7B9，432 条指令；函数边界取自 PE `.pdata`，RVA 0x2771FB6–0x277276F）。日志字符串 `"[Msg] on c2c recall nfy! frm:{} to:{}, p:{} seq:{} c_seq:{} rd:{} t:{} m_uid:{} is_off:{} trl_flag:{}  is_andr_silence:{}"`（VA 0x184833C49）在全文件仅被此处引用一次（0x1827726E0）。

```text
18277201D: mov rax, [rbp+0x230]
18277202F: lea rdx, [rbp+0x1a0]
18277203A: call [rax+0xf0]          ; 取字段 1（消息列表）到 [rbp+0x1a0]/[rbp+0x1a8]
182772040: mov rax, [rbp+0x1a8]     ; 列表尾指针
182772047: cmp rax, [rbp+0x1a0]     ; 与列表首指针比较
18277204E: je  0x182772135           ; ★ 列表为空才跳过处理 → jne（patch 后）
182772054: ...                      ; 列表非空：继续处理（字段检查、逐条解析）
1827721FB: ...                      ; 逐条处理循环（每条消息调用 sub_182772B32 填充撤回信息）
1827724FA: call 0x182772b32         ; 填充撤回信息（与群聊共用）
1827726E0: lea rax, "[Msg] on c2c recall nfy! ..."   ; 记录私聊撤回日志
182772708: call 0x182772e21         ; 日志输出
18277271B: call 0x182773018         ; HandleRecallMsgNotify（msg_seq 与 msg_client_seq 均为 0 时丢弃）
```

**与群聊的不同点（已核实）**：私聊处理函数中**没有** `cmp 长度,7; ja` 这类判断（全函数无 `cmp …,7`、无 `ja/jb/jbe/jnbe`），因此不能照搬 NapCat 的群聊点位。改为反转消息列表为空判断：正常撤回通知的消息列表非空，原 `je` 不跳转而继续处理；改为 `jne` 后，非空列表直接跳到 `0x182772135`（记录日志后清理退出），撤回处理不再执行。空列表时改为落入后续分支，但循环入口（`0x1827721FB: cmp rsi,[rbp+0x190]; je 0x18277217f`）会立即退出，不会执行删除逻辑。

### 2.3 共用下游

- `sub_182772B32`（VA 0x182772B32，大小 0x238）：私聊与群聊处理函数共用的“填充撤回信息”辅助函数，内部调用 `sub_1827781E2` 记录 `FillRecallInfoToMsgNotifyInAndrSilence` / `fill recall info: recall:{} peer_uid:{} ...` 日志。
- `sub_182773018`（`HandleRecallMsgNotify`）：私聊处理函数末尾调用，`msg_seq` 与 `msg_client_seq` 均为 0 时丢弃该通知。
- 两个处理函数均属于 `msg_recall_worker` 模块：源码路径字符串 `..\\modules\\im_core\\msg\\recall\\msg_recall_worker.cc`（VA 0x184A59CBB）在该模块约 33 个函数中被引用，日志标签均为 `HandleRecallSysMsg`，模块字符串均为 `msg_recall`。

---

## 三、目标文件与版本来源

- 安装包：`QQ_9.9.37_261103_x64_01.exe`，319 MB（334,442,672 字节），SHA256 `5cd7c13e36b391f88b2ad272fa870d74f476135b64244844ec0ad7ac7b411b48`，2026-11-03 发布（GitHub 镜像仓库 `a1515333102/QQ-Releases`，标签 `9.9.37+3.2.35`）。
  - 说明：腾讯官方 CDN（`qqdl.gtimg.cn`）从本机返回 403，无法直接下载；winget 仓库（`Tencent/QQ/NT`）只有 9.9.33.51802 / 9.9.33.52230 / 9.9.9.23424，没有 9.9.37。最终从上述 GitHub 镜像下载，SHA256 与镜像发布页一致。
- 解压：NSIS 安装包，`7z x` 解出 1975 个文件（1,243,401,293 字节），版本目录为 `versions/9.9.37-54395`。
- 目标文件：`versions/9.9.37-54395/resources/app/wrapper.node`
  - PE32+ x86-64 DLL，12 个节，118,186,536 字节
  - SHA256 `fed532ad58d2404dcedf2858554e8fa52a5f4e65b271c008d2faca4011d7d4a2`
  - ImageBase `0x180000000`，`.text` RVA 0x1000（文件偏移 0x400），`.rdata` RVA 0x4076000，`.pdata` RVA 0x7072000

---

## 四、工具与验证方法

- **REA 6.8.0**（`rea-agents`，本次因虚拟机重启后系统盘丢失而重新安装；`rea doctor --provider ghidra` 报告 healthy true）+ **Ghidra 12.1.4** + **OpenJDK 21.0.12.1**（JDK 同样因虚拟机重启丢失后重新安装）。`rea decompile --procedure 0x1827754ae --provider ghidra` 已尝试用于反编译群聊处理函数：第一次因 JDK 丢失报 `provider_unavailable`，重装 JDK 后重试，运行约 109 秒后失败（`execution_failure`，`Ghidra exited before bridge startup`，不可重试，未观测到内存溢出），未产出伪代码。因此函数级结论以 capstone 反汇编 + `.pdata` 函数边界 + 字符串交叉引用验证，与微信 4.2.0.13 的工作方法一致。
- **capstone 5.0.7**：两个处理函数及相关辅助函数的反汇编、Patch 前后指令解码验证。
- 手工 PE 解析（节表、`.pdata` 函数边界、rip-relative `lea` 交叉引用扫描）：两处日志字符串在全文件各仅被引用一次，分别落在私聊/群聊处理函数内；`HandleRecallSysMsg` 字符串共 27 处 `lea` 引用，集中在 `msg_recall_worker` 模块函数簇（VA 0x182770F22–0x18277C17A）。
- **未使用 IDA Pro**（未安装）。Hopper 未安装。
- 注意事项：
  - **拍一拍（PaiYiPai）是另一个处理函数**：`sub_182776716`（VA 0x182776716）处理“拍一拍”撤回系统消息（日志 `on recall group/c2c PaiYiPai sys msg! ...`），其中也有一处 `cmp rax,7; ja 0x182776ad9`（VA 0x1827768AE/0x1827768B2），**本次未 Patch**——它是拍一拍功能，不是普通消息撤回。
  - 替换 `wrapper.node` 后，QQNT 启动时如有完整性校验可能报错或拒绝加载，实机测试时需先备份原文件。
  - 本记录为静态验证，未在 Windows 上实机测试；建议在 Windows 上按以下步骤验证：备份原 `wrapper.node` → 替换为 `wrapper.node.patched-9.9.37-recall` → 另一账号在私聊与群聊中各发一条消息后撤回 → 确认原消息内容仍保留。
