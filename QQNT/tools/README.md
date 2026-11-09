# QQNT 研究工具

## 适用版本

| QQNT 应用版本 | wrapper.node PE 文件版本 |
| --- | --- |
| `9.9.36-53644` | `9.8.0.24541` |
| `9.9.37-54395` | `9.8.0.24704` |

## 只读分析器

[analyze_recall.py](analyze_recall.py) 读取指定的 `wrapper.node`，输出应用版本、PE 文件版本、哈希、日志引用、PE 展开区间和反汇编。依赖 Python、`pefile`、`capstone`。从同目录 `package.json` 读取 QQNT 版本，从 PE 固定版本资源读取 wrapper.node 版本；无法取得的值保留为空，不推测版本。

```powershell
python QQNT/tools/analyze_recall.py 'E:\Program Files\Tencent\QQNT\versions\9.9.37-54395\resources\app\wrapper.node' --out "$env:TEMP/qqnt-recall-analysis-new"
```

请使用新的输出目录，避免覆盖已归档证据。`--pid` 与 `--module-base` 可选且必须成对传入，仅执行 ReadProcessMemory 比对，不写进程内存、不执行目标程序。

## 特征验证源码

[ValidateFeatures_QQNT_9.9.37-54395_wrapper.node_9.8.0.24704.cs](ValidateFeatures_QQNT_9.9.37-54395_wrapper.node_9.8.0.24704.cs) 对应 QQNT `9.9.37-54395` / wrapper.node `9.8.0.24704` 的**原始文件**。编译时链接主补丁器项目的 `JsonData`、模型、`ByteUtil`、`VersionUtil`、匹配器及 `BusinessException`，使用 .NET Framework 4.5.2 参考程序集；不能直接作为独立单文件程序编译。

它检查版本范围选择、两条特征各唯一命中、8 字节变化、内存副本哈希和修改后特征识别，不修改安装文件。已有结果见 [验证输出](../evidence/QQNT_9.9.37-54395_wrapper.node_9.8.0.24704/matcher-validation.txt)。归档的是验证时的研究源码；主补丁器后续配置变动时，应重新编译并核对适用范围。

## REA / IDA

[REA_IDA_配置与故障记录.md](REA_IDA_配置与故障记录.md) 保存实际配置、Windows 启动器处理及全模块导入超时经验。关联的大模块研究为 QQNT `9.9.36-53644` / wrapper.node `9.8.0.24541`，不把超时诊断当作成功伪代码证据。
