# 本机 REA / IDA 配置记录

配置日期：2026-11-08。关联的大模块分析：QQNT `9.9.36-53644` / `wrapper.node` PE 文件版本 `9.8.0.24541`；本文件记录当时环境，不代表实时系统状态。

## 安装与配置

- IDA：`E:\Program Files\IDA Professional 9.3`。
- IDALib 实际加载版本：`9.3.260421`。
- REA：现有 `6.8.0`，保持不变。
- 独立 Python 环境：`C:\Users\huiya\.local\share\rea-ida\venv`。
- 桥接程序：`ida-pro-mcp 2.0.0`，上游提交固定为 `c133c3853faa111a9b00ee615c013b720d0c4acd`。
- IDALib Python 绑定：`idapro 0.0.12`，安装于上述独立环境。
- REA 的 IDA 注册文件：`C:\Users\huiya\.local\share\rea-ida\ida-mcp.json`。
- Codex 配置：`C:\Users\huiya\.codex\config.toml`。
- 原配置备份：`C:\Users\huiya\.codex\config.toml.before-rea-ida-20261108-234031.bak`。

原有 Codex 配置字节和注释全部保留，仅追加：

```toml
[mcp_servers.rea.env]
REA_IDA_MCP_CONFIG = "C:\\Users\\huiya\\.local\\share\\rea-ida\\ida-mcp.json"
```

注册文件使用 `mode: headless`，通过标准输入输出连接后台 IDALib supervisor，最多一个 worker。无需在 IDA GUI 中手动打开文件或启动插件。既有 IDA 安装文件、用户许可证和 `ida-config.json` 未修改。

## Windows 启动器修复

最初使用虚拟环境的 `Scripts\python.exe`，反编译成功，但关闭后 REA 报告 `cleanup_incomplete`。切换为真实解释器 `C:\ProgramData\miniconda3\python.exe`，通过 `PYTHONPATH` 指向独立环境的 `Lib\site-packages`，并设置 `PYTHONNOUSERSITE=1` 后，反编译与会话关闭均成功。没有修改桥接程序或 REA 源码。

注册文件同时设置 `IDADIR` 和 `PYTHONUTF8=1`。这些环境变量只作用于桥接进程，不修改 Windows 全局环境变量。

## 验证结果

1. `rea doctor --provider ida --client codex --format json` 的本次请求范围检查 `healthy: true`。`environment_healthy: false` 是全环境指标，还包含未安装的其他提供程序，不代表 IDA 检查失败。
2. 对 `C:\Windows\System32\whoami.exe` 入口 `0x140001CB0` 完成真实反编译，输出 `wmainCRTStartup()`、`_security_init_cookie()` 和 `_wmainCRTStartup()`。
3. 该次 Evidence：`ev_e073ed6da580a82c631d1282d3418611d56887e6bc6deeed069cbf40e409bb17`；`hexrays_ready: true`，REA 命令退出码为 `0`。
4. 完整验证输出：`C:\Users\huiya\.local\share\rea-ida\smoke-decompile-fixed.json`。

额外对 QQ `wrapper.node` 的检查进入了 `idb_open` 全模块自动分析，运行数分钟后仍报告 busy；最终未获得伪代码，REA 报告 300,000 ms 注册超时及清理未完成。已核对并停止仅属于这次检查的后台 worker，随后通过上游 `idb_list` 确认 `sessions: []`。QQ 进程及安装文件未修改。这个大模块的完整反编译仍未验证；如后续继续，应根据超时诊断提高注册文件的 `timeoutMs`，并相应给外层 MCP `tool_timeout_sec` 留出执行与清理时间，避免原样重跑。

最终 worker 清单：`C:\Users\huiya\.local\share\rea-ida\final-worker-inventory.json`。大模块尝试结果保存在仓库的 `../evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/rea-ida-diagnostic.json`，其内容是错误诊断，不是反编译证据。

自动安全审查拒绝了删除本次测试临时目录的操作（blocked by policy），未提供更具体原因。因此保留以下目录，不影响新会话使用：

- `C:\Users\huiya\AppData\Local\Temp\rea-ida-0246a0b850922b483402839654014e2b`。
- `C:\Users\huiya\AppData\Local\Temp\rea-ida-e60ae25278ff656fe4e2b0049c594987`。

当时聊天的 REA MCP 进程在配置前已经启动，因此需要重启以继承新环境。重启 Codex 后，新启动的 REA 服务会读取上述配置。重启前可通过 CLI 显式设置变量使用：

```powershell
$env:REA_IDA_MCP_CONFIG = 'C:\Users\huiya\.local\share\rea-ida\ida-mcp.json'
rea doctor --provider ida --client codex --format json
rea decompile 'E:\Program Files\Tencent\QQNT\versions\9.9.36-53644\resources\app\wrapper.node' --procedure 0x18274B606 --provider ida --format json
```

## 来源

- 本机 REA 技能：`C:\Users\huiya\.agents\skills\reverse-engineer-anything\SKILL.md`。
- 实际注册字段和生命周期按本机 REA 6.8.0 的 `dist\ida\IdaConfiguration.js`、`IdaSessionClient.js` 核对。
- [IDA Pro MCP 上游](https://github.com/mrexodia/ida-pro-mcp)：使用其 IDALib headless supervisor 接入方式。

## 后续分析预算调整

继续研究时，将 IDA 注册文件的 `timeoutMs` 从 `300000` 提高到 `1800000`（30 分钟），原注册文件备份为 `C:\Users\huiya\.local\share\rea-ida\ida-mcp.before-large-analysis-20261108-235349.json`。

当前桌面 REA 的外层 `tool_timeout_sec` 仍为 450 秒。为避免一次大型导入被这个外层预算打断，当时使用的一次性会话脚本通过 REA 公共 `rea.mjs mcp` 启动独立且持久的 MCP 会话，同一会话内依次完成多个函数查询、Evidence 导出和关闭。该历史会话使用 REA 的 IDA 提供程序及其身份校验；一次性脚本已清理，保留故障结论和归并诊断。

实际结果：本轮独立会话确实运行到 1,800,000 ms 的 IDA 注册预算，最终在 `idb_open` 阶段超时，尚未取得函数伪代码。`close_binary` 返回清理未完成，随后独立上游 `idb_list` 确认 `sessions: []`，系统进程清单也未发现桥接 worker。失败诊断与后续清单保存在项目 `../evidence/QQNT_9.9.36-53644_wrapper.node_9.8.0.24541/rea-ida-diagnostic.json`。本次保留的私有临时数据库目录是 `C:\Users\huiya\AppData\Local\Temp\rea-ida-8201654bf16e7e8ba90b4fbb54e152fa`，未尝试删除。

## 恢复配置

如需撤回配置，只需删除本次追加的 `[mcp_servers.rea.env]` 表，或在确认没有后续其他配置改动后恢复上面记录的原配置备份，再重启 Codex。独立桥接环境可保留，不影响 IDA GUI。
