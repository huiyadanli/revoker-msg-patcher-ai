# QQNT 9.9.36-53644 / wrapper.node 9.8.0.24541 防撤回研究

> QQNT 应用版本：`9.9.36-53644`；`wrapper.node` PE 文件版本：`9.8.0.24541`；平台：Windows x64。

研究日期：2026-11-08；用户实测反馈日期：2026-11-09。

## 当前安装状态（2026-11-09）

用户授权在原目录备份并应用后，已执行本文“固定走已有退出分支”的两处修改，共 8 个实际字节发生变化。QQ 已重新启动，PID `52412` 加载了指定版本的修改后 `wrapper.node`；只读核对两处完整函数区间，均与修改后的磁盘文件一致。用户后续已反馈本版本防撤回正常；助手没有发送测试消息或执行撤回事件。

- 原目录完整备份：`E:\Program Files\Tencent\QQNT\versions\9.9.36-53644\resources\app\wrapper.node.recall-backup-20261109-004245-625118.bak`。
- 原始 SHA-256：`0d8b94448f4dafe7337b88d6a568b004224c37fcbe2bd1142c1af7624fbd534c`。
- 已安装 SHA-256：`115226f7b8e0307fd999809bb73cdbe62fe5f9a21f9d4ec76ecb5ee326fd5289`。
- 原目录操作记录：`wrapper.node.recall-install-20261109-004245-625118.json`。
- 仓库操作记录：`evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/installation-record.json`。
- 修改后加载证据：`evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/analysis-patched.json`。

下文保留前期分析及安装前的候选计划、诊断和快照。计划 JSON 中的未安装状态属于当时记录；当前安装状态以上述操作记录为准，不能把启动成功等同于防撤回功能已验证。

如需恢复，先从托盘完全退出 QQ，再将上述 `.bak` 文件复制覆盖同目录 `wrapper.node`，确认恢复后的 SHA-256 与原始值一致，然后启动 QQ。

## 安装前研究结论与证据范围

原理只参考用户指定的 [NapCat《防撤回寻找与思考》](https://napneko.github.io/other/ntrecall)。其他 QQNT 文档不作为本报告的结论依据。

已从当前安装的 `wrapper.node` 的接收撤回日志、代码引用和 `.pdata` 区间中定位群聊、私聊处理代码。两个候选分支已通过本版本实际字节和 Capstone 解码核对。对 QQ 主进程中加载的两个处理区间进行了只读内存比对，完整区间字节与磁盘一致。

**前期研究阶段未修改 QQ 文件或进程，也未触发受控撤回事件。** 下文定位和控制流结论属于静态研究；后续安装已完成，且已收到用户测试正常的反馈；安装前快照中的未实测状态保留其历史含义。

## 目标身份与运行现场

- 安装目录：`E:\Program Files\Tencent\QQNT\versions\9.9.36-53644`。
- 运行的启动程序：`E:\Program Files\Tencent\QQNT\QQ.exe`。
- 子进程命令行的 `--app-path` 指向上述版本的 `resources\app`；主进程实际加载该版本的 `QQNT.dll` 和 `wrapper.node`。
- 主进程 PID：本次观测为 `30608`；后续运行不能复用此 PID。
- `wrapper.node`：PE32+ AMD64，117,866,024 字节。
- SHA-256：`0d8b94448f4dafe7337b88d6a568b004224c37fcbe2bd1142c1af7624fbd534c`。
- PE ImageBase：`0x180000000`。
- 本次运行模块基址：`0x211B1490000`，受 ASLR 影响，重启后应重新枚举。
- `package.json` 声明 `isPureShell: true`、`isByteCodeShell: true`，主入口为 `application.asar/app_launcher/index.js`；不能假定修改普通 JS 文件就能控制 native 撤回处理。

后续现场复核时，QQ 已重启为 PID `33692`，仍加载 `9.9.36-53644` 的相同模块。新 `wrapper.node` 基址为 `0x7FF8E46A0000`，再次读取群聊区间 2,530 字节、私聊区间 1,977 字节，均与磁盘完全相同。最新观测见 `evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/analysis-runtime-recheck.json`；前面的 PID 和基址是首次观测值，不能在重启后继续使用。

## 定位链路

从接收方向的 `on ... recall` 日志出发，扫描可执行节里的 RIP 相对 LEA 引用，再用 PE 异常目录 `.pdata` 的展开区间限定反汇编范围。`.pdata` 区间不保证在所有情况下等于完整的源码函数。

| 场景 | 日志字符串 VA | 已发现的 LEA 引用 | 所属 `.pdata` 区间，右端不含 |
| --- | --- | --- | --- |
| 群聊 | `0x184800C98` | `0x18274BEC3` | `0x18274B606`—`0x18274BFE8` |
| 私聊 | `0x184800D72` | `0x182748838` | `0x18274810E`—`0x1827488C7` |

群聊日志以 `[Msg] on grp recall nfy !` 开头；私聊日志以 `[Msg] on c2c recall nfy!` 开头。上述两条日志在本次扫描的 REX.W RIP-LEA 引用范围内，各发现一处引用。该扫描不覆盖所有可能的取址方式，不能等同于完整反编译器 xref 清单。

两个区间都引用 `..\modules\im_core\msg\recall\msg_recall_worker.cc`、`HandleRecallSysMsg`，支持其属于撤回系统消息处理链路的判断。

## 群聊候选

```asm
18274B6C0  mov rdx, [rbp+148h]
18274B6C7  mov r8,  [rbp+150h]
18274B6CE  mov rax, r8
18274B6D1  sub rax, rdx
18274B6D4  cmp rax, 7
18274B6D8  ja  18274B81Ah       ; 候选：改为 jbe
; 落入错误日志分支，随后跳至清理代码
...
18274B81A  add rdx, 7           ; 原成功分支跳过 7 字节前缀，继续解析
```

字节差值代表长度；原代码只在长度大于 7 时进入解析，其他情况记录 `kBytesMsgContent is error` 后转入清理。把 `ja` 反转成 `jbe`，会使正常的长度大于 7 的通知走错误退出路径。这与参考文档所示的群聊思路相符。

**反转判断也会使长度小于等于 7 的异常输入进入原解析路径。** 所以单字节反转适合复现研究思路，不能据此推定所有异常输入都安全。若制作长期使用的补丁，应审查固定跳过解析的方案及所有清理路径，而非仅追求改动字节数最少。

## 私聊候选

```asm
182748192  call qword ptr [rax+0F0h] ; 取得消息信息集合
182748198  mov rax, [rbp+1A8h]
18274819F  cmp rax, [rbp+1A0h]      ; 首尾相等意味着集合为空
1827481A6  je  18274828Dh           ; 候选：改为 jne
; 原非空分支继续检查、遍历消息
...
18274828D  ...                     ; no any msg info 日志
1827482D7  lea rcx, [rbp+1A0h]
1827482DE  call 180014840h          ; 清理集合
1827482E3  ...                     ; 清理参数对象并返回
```

私聊不能直接套用群聊的 `cmp ...,7`。这里可研究反转集合为空判断：非空的正常通知会跳至日志与清理路径，绕过逐条处理。反转后空集合落入后续字段处理，虽然后面的迭代入口仍检查首尾相等，完整副作用仍需运行验证。固定走原空集合出口也是值得评估的替代方案。

## 两处具体偏移

以下是早期条件反转方案，只适用于上面列出的原始文件 SHA-256；该方案未安装。实际采用的固定清理出口方案见下一节。

| 场景 | 分支指令 VA | 指令起始文件偏移 | 原指令字节 | 研究用反转字节 | 实际单字节修改位置 |
| --- | --- | --- | --- | --- | --- |
| 群聊 | `0x18274B6D8` | `0x274AAD8` | `0F 87 3C 01 00 00` | `0F 86 3C 01 00 00` | `0x274AAD9`：`87 → 86` |
| 私聊 | `0x1827481A6` | `0x27475A6` | `0F 84 E1 00 00 00` | `0F 85 E1 00 00 00` | `0x27475A7`：`84 → 85` |

这里 `.text` 的 RVA 为 `0x1000`，文件偏移为 `0x400`，所以这两处的文件偏移为 `VA - ImageBase - 0xC00`。通用实现必须依照节表映射，不能把该公式推广到任意节或版本。

内存地址为 `实际模块基址 + RVA`，不能把上表静态 VA 直接用于进程写入。本次群聊区间 2,530 字节、私聊区间 1,977 字节的磁盘与内存比对均完全相同；这仅证明观测时的相关代码一致，不能证明撤回事件命中过这些位置。

### 当前采用：固定走已有退出分支

为避免反转判断后让异常输入进入原成功路径，采用以下固定退出方案。两处各占用原来的 6 字节，已安装并由用户反馈测试正常：

| 场景 | 文件偏移 | 原字节 | 候选字节 | 控制流 |
| --- | --- | --- | --- | --- |
| 群聊 | `0x274AAD8` | `0F 87 3C 01 00 00` | `90 90 90 90 90 90` | 去掉条件跳转，始终落到原错误日志和清理分支 `0x18274B6DE` |
| 私聊 | `0x27475A6` | `0F 84 E1 00 00 00` | `90 E9 E1 00 00 00` | `nop; jmp 0x18274828D`，始终进入原空集合日志与清理分支 |

Capstone 已核对两段完整 6 字节的解码及目标地址。私聊把 6 字节 Jcc 改成 `1 字节 nop + 5 字节 jmp` 后，指令结束位置保持不变，故相对位移 `E1 00 00 00` 可以保持；不能简单把操作码第一个字节换成 `E9` 而忽略指令长度。

前期在内存副本中核对上述两处修改，共有 8 个字节变化，修改后 SHA-256 为 `115226f7b8e0307fd999809bb73cdbe62fe5f9a21f9d4ec76ecb5ee326fd5289`。随后已在用户授权下完成原目录备份和安装，并收到用户测试正常的反馈。原始计划见 `evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/patch-plan.json`，其未安装字段属于最初计划快照；实际安装状态见 `evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/installation-record.json`。用户未提供逐项场景清单，不补记主动撤回、离线同步等具体行为已全部测试。

## 实现方式选择

| 方式 | 适用目标 | 主要边界 |
| --- | --- | --- |
| native 接收处理分支补丁 | 研究保留客户端原始消息处理状态 | 必须按哈希与原字节检查；更新后重新定位；验证退出和清理路径 |
| native hook 隔离“观察通知”和“应用撤回” | 同时保留原消息、记录操作者、添加提示 | 保留通知解析，再有选择地阻止状态改变；需要确认结构体、ABI、线程及回调生命周期 |
| JS/插件缓存与重绘 | 快速展示已收到的撤回前内容 | 内容必须提前收到并缓存；前端重绘不能证明 native 数据库保留了原记录 |

对本版本，优先研究 native 接收链路有充分静态依据。要显示“谁撤回了哪条”，应在丢弃通知前保留观察通道，按会话标识、消息序号及操作者信息关联原消息，再研究通过 `msgService.addLocalGrayTip` 等客户端接口提示。该接口名称来自参考文档，**本次尚未验证当前版本的 JS 接口签名和可调用性**。

后续直接检查本版本字节时，精确 ASCII `addLocalGrayTip\0` 没有命中，但找到了以下 native JS 回调包装函数；它们通过导入的 `napi_get_cb_info` 取得参数信息，然后检查参数数量：

| 当前模块中的名称 | `.pdata` 包装函数入口 | 可见 argc 检查 |
| --- | --- | --- |
| `addLocalGrayTipMsg` | `0x180FE979A` | `3` |
| `addLocalJsonGrayTipMsg` | `0x180FE9AFE` | `4` |
| `addLocalJsonGrayTipMsgExt` | `0x180FE9EDE` | `5` |

名称、错误断言、参数数量判断与函数区间由当前二进制交叉核对，见 `evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/graytip-wrappers.json`。另外发现 `addKernelMsgListener`、`onMsgRecall`、`onRecvSysMsg` 的字符串和 RIP-LEA 引用，见 `evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/interface-strings.json`。这些事实不能证明 JS 对象的取得方式、参数字段或回调触发时机；也不能以一次 ASCII 负向搜索断言任意动态 JS 别名不存在。实际使用时应核对当前接口，不能直接照抄旧名称或凭 argc 猜参数内容。

尤其需要验证监听器相对于 native 状态变更的时序。`onMsgRecall` 的名称不能证明回调发生在删除前，提前退出 worker 也可能同时阻断原本从该路径发出的通知。若要同时保留消息和撤回提示，应独立观察原始系统消息，或在退出前复制所需元数据，并通过合适的线程调度发送提示；这些属于基于原文思路的实现设计，尚未进行当前版本的事件时序实测。

阻止本机应用撤回不能恢复此前已经删除的本地记录，也不能保证服务器上已失效的图片或文件资源仍可下载。是否保留数据库、附件和重启后的消息内容，需要分别测试。

## 研究经验与验证顺序

1. 先确认运行中的版本、模块路径和哈希。安装目录里存在某版本，不代表进程已加载它；本次已核对实际模块。
2. 区分主动撤回请求和收到撤回通知。不能看到 `recall` 就修改，尤其要排除发包、定时处理和拍一拍撤回等其他链路。
3. 沿日志引用追踪控制流，检查分支两侧、对象初始化和析构，不凭字符串位置或相似的旧版偏移判定补丁。
4. `ja` 与 `jnbe` 是同一无符号条件；修改前后都要解码指令，保持指令边界、位移和目标正确。仅替换某个全文件字节模式不足以判断语义。
5. 将原始文件哈希、原字节、函数区间、候选补丁和验证状态分开记录。遇到不匹配应停止，避免把新版安装文件当旧版修改。
6. 用自有测试账号分别验证私聊、群聊、管理员撤回、自己主动撤回、文本、图片/文件、离线后上线、历史同步和重启持久性；检查普通消息收发是否正常。用户已反馈防撤回正常，但未逐项提供这些具体场景的测试结果。
7. 断点命中只能证明进入代码；界面短暂保留也不能证明数据库、附件和下次同步结果。需要分别记录这些层次的结果。

## 可复现材料

- [只读分析工具](tools/analyze_recall.py)：提取日志引用、函数区间及反汇编，输出同时注明 QQNT 与 wrapper.node 文件版本；可选只读内存比对。
- [原始分析摘要](evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/analysis-original.json)、[重启后复核](evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/analysis-runtime-recheck.json)、[补丁加载复核](evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/analysis-patched.json)：保留各次观测的身份、哈希和函数范围。
- [补丁计划](evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/patch-plan.json)、[安装记录](evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/installation-record.json)：原始字节、修改字节、完整备份路径及安装校验。
- [证据目录](evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/)：保留群聊、私聊、共用填充、延迟通知与拍一拍对照反汇编；相同输出只存一份。
- [REA / IDA 配置与故障记录](tools/REA_IDA_配置与故障记录.md)、[归并的超时诊断](evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/rea-ida-diagnostic.json)。诊断不是成功反编译证据。

## 后续 REA 检查：应用入口

REA 静态分析再次读取了 `application.asar`，其 SHA-256 为 `e2a43308e5a373f7225318cb3792e264f88799a0bdebde2fcdd61f734550f10b`。明确选取的 `app_launcher/index.js`、`preload.js` 和 `preload_chatwin.js` 三个成员均报告 `text_status: invalid-utf8`，共 576 字节，未解析出 JavaScript 源码。该结果与包声明的 bytecode shell 相容，但不能仅凭这些字节断言具体加密或字节码格式。

证据：`ev_160eca54e4bfe56f129da9f2c02ff5680ab5e22249939a361fd9ec347e1039bb`，完整原始 REA JSON 无损压缩保存在 `evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/rea-asar-bundle.json.gz`，解压字节与清理前完全一致。只选择了三个入口；其余 184 个相关文件未纳入语义分析。因此不能把静态分析未恢复出的 IPC、JS API 或撤回监听器当作程序中不存在这些功能。

## 后续 REA 检查：native 模块边界

REA 独立解析了 `wrapper.node` 的 PE 导入导出表，文件哈希与前文一致，覆盖状态均为 complete：

- 导出 66 项，包含 `INTSessionShell`、`IGProSessionShell` 的构造、赋值和创建入口；未发现名为 `napi_register_module_v1` 的导出。
- 普通导入来自 38 个 DLL，共 1,248 项，没有延迟导入目录。
- 从 `QQNT.dll` 导入了 `qq_magic_napi_register`（IAT RVA `0x4AD4348`）、`napi_call_function`、`napi_get_named_property`、`napi_get_uv_event_loop`、`uv_async_init`、`uv_async_send`，同时也导入 V8 / Node 的 C++ 符号。

这些表项支持“存在 QQ 自有注册边界、N-API 和事件循环基础设施”的判断；它们不能证明普通 Node 的注册流程可以原样使用，也不能证明某个 N-API/libuv 函数被用于撤回处理。模块构造与 C++ 工厂导出也不是可直接调用的 JS API。研究 hook / 回调桥接时，还需确定真实会话对象、线程归属和生命周期。

通用线程规则可参考 [Node-API 官方文档：线程安全函数](https://nodejs.org/download/release/v22.18.0/docs/api/n-api.html#asynchronous-thread-safe-function-calls)：不能从任意新增 native 线程直接使用依赖 JS 环境的 API，应经过适当的主线程调度或线程安全机制。该文档只作为接口使用约束的来源，不代表当前 QQ 内嵌 Node 的版本。本次导入表未列出 `napi_call_threadsafe_function`，所以也没有将这种机制认定为 QQ 当前使用的回调实现。

导出证据：`ev_1c0039851bd62a91283e79fa886408645b5dce2972bd8c17274b434783a7a7bf`；导入证据：`ev_45cb8befbf82fd85928679e18b858542c68f0e17030d283f4ca43b0842c674ec`。完整记录保存在 `evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/rea-pe-bundle.json`。

## 本轮 REA / IDA 结果与剩余问题

原理依据限定为用户提供的 NapCat 链接；版本地址、字节、接口名称和现场状态均由当前目标取得，其他 QQNT 文档不作为证据。

| 研究问题 | 本轮结果 | 证据范围 |
| --- | --- | --- |
| 当前运行的模块是否还是指定版本 | 是；后续 PID `33692` 的模块路径仍指向 `9.9.36-53644`，两处完整区间与磁盘一致 | 只读模块枚举、`ReadProcessMemory` 和 SHA-256；未观察实际撤回事件 |
| 群聊与私聊候选分支是否对应当前字节 | 已核对日志引用、PE 展开区间、指令长度和原始字节 | Capstone / PE 静态分析，不能宣称已验证防撤回效果 |
| 应用入口是否能直接恢复 JS 源码 | 所选三个入口均为 invalid-utf8，未恢复语义 | REA ASAR Evidence；其余相关文件未作语义分析 |
| native 模块边界能否独立确认 | 已取得完整 PE 导入导出表 | REA PE Evidence；导入声明不等同于调用轨迹 |
| IDA 是否取得撤回函数伪代码 | 未取得；首次 `idb_open` 自动分析达到 1,800,000 ms 后返回 `provider_timeout` | `evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/rea-ida-diagnostic.json` 是错误诊断；后续私聊及下游查询未执行 |
| 超时后的资源状态 | REA `close_binary` 返回 `cleanup_incomplete`；随后独立上游清单为 `sessions: []`，未发现桥接 worker 进程 | `evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/rea-ida-diagnostic.json`；保留失败临时数据库，不将外部清单冒充成功的 REA close 证据 |

REA 超时、清理异常与后续空会话清单已归并到 `evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/rea-ida-diagnostic.json`。空证据包和重复运行输出已清理；本轮没有取得 native 函数伪代码。

当前 REA 6.8.0 的 IDA headless 路径在首次查询时明确请求 `run_auto_analysis: true`，因此只查询一个函数也要先完成整模块自动分析。这是本轮的实际瓶颈；将外层调用改成长时间独立会话，解决了 450 秒桌面工具预算的问题，但没有消除 IDA 全模块分析的耗时。后续需要持久保存并复用实际 IDA 分析数据库的工作流，或经兼容性核对的已有数据库附加方式；不应反复原样启动冷导入并把超时视为撤回函数不存在。

当前固定退出方案已安装并由用户反馈测试正常。仍未补齐的研究包括完整通知/数据库调用链、未提供的具体稳定性与同步场景、灰条接口参数结构和线程时序。助手未发送测试消息；用户功能反馈与机器码核对分别记录。

## 参考

- [NapCat：防撤回寻找与思考](https://napneko.github.io/other/ntrecall)，其测试版本为 NTQQ 34740。本文按当前二进制重新定位，没有将旧版地址作为当前证据。
