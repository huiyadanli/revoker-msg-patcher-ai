# QQNT 9.9.36-53644 / wrapper.node 9.8.0.24541 证据

- QQNT 应用版本：`9.9.36-53644`。
- wrapper.node PE 文件版本：`9.8.0.24541`。
- 原始 SHA-256：`0d8b94448f4dafe7337b88d6a568b004224c37fcbe2bd1142c1af7624fbd534c`。
- 固定退出方案修改后 SHA-256：`115226f7b8e0307fd999809bb73cdbe62fe5f9a21f9d4ec76ecb5ee326fd5289`。
- 验证状态：用户反馈防撤回正常；具体测试范围见[主记录](../../QQNT_9.9.36-53644_wrapper.node_9.8.0.24541_防撤回研究.md)。

`analysis-original.json` 保留原始文件、日志引用、函数范围和运行时摘要。仅保留与结论直接相关的五类反汇编：群聊、私聊、共用撤回信息填充、延迟通知、拍一拍对照。对应文件采用语义名称；未保留的辅助反汇编在分析 JSON 中明确标记，函数范围和统计仍保留。

REA 原始证据包不改写其内容；本地整理的分析摘要额外注明双版本信息。原始计划、只读快照和当前用户反馈属于不同阶段，不能把安装前字段当作当前安装状态。

## 其他保留材料

- `analysis-runtime-recheck.json`：重启后、补丁安装前的只读复核，与原始 ASM 共用一份文件。
- `analysis-patched.json`：补丁加载后的只读复核；仅群聊、私聊另存 `.patched.asm`，其他相同内容不重复保存。
- `patch-plan.json`、`installation-record.json`：字节计划、原目录备份及安装校验。
- `graytip-wrappers.json`、`graytip-strings.json`、`interface-strings.json`：接口名称与包装函数的研究事实，不等同于接口调用实测。
- `rea-ida-diagnostic.json`：归并的超时和清理观察，不是成功反编译结果。
- `rea-pe-bundle.json`：原始 PE 导入导出 Evidence。
- `rea-asar-bundle.json.gz`：原始 ASAR Evidence，无损压缩。解压后 SHA-256：`b5a8049c505bcc83baaa6fae69f69a63154a7d7b6ae964cfd2f3c13c2709fc79`，原始大小 3,685,787 字节。

使用 Python 标准库 `gzip` 或归档工具即可读取 `.json.gz`；其解压字节已与原始证据逐字节比对。
