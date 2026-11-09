# 微信 PC 4.1.12.55 防撤回研究

> 版本：Weixin 4.1.12.55（`E:\Program Files\Tencent\Weixin\4.1.12.55\Weixin.dll`）
> 参考实现：`E:\HuiTask\防撤回\微信\4.1.7.26 / 4.1.7.28 / 4.1.7.30 / 4.1.9.30`（用 `diff_hex.py` 对比原始与已 Patch DLL 得到参考点）
> 目标效果：**他人撤回消息后，原消息内容仍保留在界面上**（撤回提示不显示，内容原样保留）
> 修改方式：**单点字节级 Patch**（newmsgid 篡改，7 字节），实测有效 ✅

---

## 〇、最终结论（经过实测验证）

**只需一个 Patch：篡改撤回通知中的 newmsgid（新消息 ID），使撤回执行查找原消息失败。**

```
mov qword ptr [rsi+0x248], rax    →    sub qword ptr [rsi+0x248], rax
（newmsgid = 解析值）                  （newmsgid -= 解析值 → 错误 ID）
```

**原理**：收到他人撤回通知（revokemsg sysmsg）时，客户端解析出 `newmsgid`（被撤回的原消息 ID），然后按该 ID 查找本地消息并替换/删除其内容。若把 `mov`（赋值）改成 `sub`（累减），存进对象的 newmsgid 变成错误值，撤回执行找不到原消息 → 原消息内容原样保留在界面上。

> 备注：参考实现（4.1.7.30 / 4.1.9.30）还额外 patch 了"撤回核心入口 jz→jmp"作双保险，但 **4.1.12.55 实测仅 newmsgid 篡改一个点就足够**，无需第二处。

---

## 一、Patch 点位（4.1.12.55，最终生效版本）

| 文件偏移 | VA | 原字节 | 修改后 | 说明 |
|---|---|---|---|---|
| `0x23622CD` | `0x182362ECD` | `48 89 86 48 02 00 00` | `48 29 86 48 02 00 00` | `mov [rsi+0x248],rax` → `sub [rsi+0x248],rax`（篡改 newmsgid） |

- 换算：`.text` 段 RVA 0x1000 → 文件偏移 0x400；`文件偏移 = 0x400 + (VA - 0x180001000)`。
- `sub` 编码：只把第 2 字节 `89`→`29`（`48 89 86`→`48 29 86`），**REX.W 前缀 `48` 与后续 disp 不变**。
- 反汇编验证：`sub qword ptr [rsi + 0x248], rax`

---

## 二、所属函数与上下文

Patch 在 **`sub_182362720`**（revokemsg sysmsg 通知解析器，VA 0x182362720）：

```c
// 反编译（patch 前）
sub_180631060(v36, &v34, "newmsgid");      // 从 sysmsg 取 newmsgid 字段
if ( !sub_1801F73D0(&v34) )
    *(_QWORD *)(a1 + 584) = sub_180F8ADD0(v34);  // a1+584 = 0x248：newmsgid = 字符串→数字
```

对应汇编（patch 处 VA 0x182362ECD）：
```asm
182362EB2: call 0x1801f73d0      ; "newmsgid" 键存在?
182362EB8: test al, al
182362EBA: jne 0x182362817
182362EC0: mov rcx, [rbp+0x200]  ; newmsgid 字符串
182362EC7: call 0x180f8add0      ; 字符串→数字 (sub_180F8ADD0)
182362ECC: nop
182362ECD: mov [rsi+0x248], rax  ; ★ newmsgid = 解析值 → sub（patch 后）
182362ED4: mov [rbp+0x208], r13
```

- `a1 + 584 == 0x248`：newmsgid 字段（后续撤回执行用它查找原消息）。
- 该函数还解析 `session`(a1+624)、`replacemsg`(a1+592)、`revoketime`(a1+816)、`chat_id`(a1+880)、`revoke_climsgid`(a1+912) 等，是撤回通知的入口解析器。

---

## 三、参考实现的对应关系

参考版本的同一逻辑点（跨版本字段偏移变化，模式相同）：

| 版本 | 文件偏移 | 指令 | 所属函数 |
|---|---|---|---|
| 4.1.7.30 | `0x1FC9DBD` | `mov/sub [rsi+0x1A8],rax` | 处理 revokemsg sysmsg 的函数 |
| 4.1.9.30 | `0x021CC15D` | `mov/sub [rsi+0x1C8],rax` | `sub_1821CC5C0`（字符串特征 revokemsg/chat_id/revoke_climsgid/replacemsg） |
| **4.1.12.55** | **`0x23622CD`** | **`mov/sub [rsi+0x248],rax`** | **`sub_182362720`** |

三者是**同一逻辑**：把 `call <字符串→数字>; nop; mov [obj+newmsgid偏移], rax` 改成 `sub`。字段偏移随版本不同（0x1A8 / 0x1C8 / 0x248）。

---

## 四、实施脚本（可复现 / 可回滚）

```python
import hashlib

path = r"E:\Program Files\Tencent\Weixin\4.1.12.55\Weixin.dll"

# ── 打 patch ──────────────────────────────────────────────
data = bytearray(open(path, "rb").read())
off = 0x23622CD
old = bytes.fromhex("48 89 86 48 02 00 00")   # mov [rsi+0x248],rax
new = bytes.fromhex("48 29 86 48 02 00 00")   # sub [rsi+0x248],rax
assert bytes(data[off:off+len(old)]) == old, f"mismatch: {bytes(data[off:off+7]).hex()}"
data[off:off+len(new)] = new
open(path, "wb").write(bytes(data))

# ── 回滚（恢复原始 mov）─────────────────────────────────────
# data[off:off+len(old)] = old

print("SHA256:", hashlib.sha256(bytes(data)).hexdigest())
```

已应用文件：`Weixin.dll`（SHA256 `2e5ec0fda673972abf21dcd03c1aef60227af8e5afd6cb92e74467838b04d4b6`，194,903,080 字节）
原始备份：`E:\Program Files\Tencent\Weixin\4.1.12.55\Weixin.dll.bak`

---

## 五、版本迁移指南（下一个版本如何定位）

**优先**：用 `diff_hex.py` 对比同目录参考版本的原始/已 Patch DLL，直接得到 Patch 点。

**纯 IDA / 字节搜索定位**（无参考版本时）：
1. 在 `.text` 中搜字节模式 `8b 8d 00 02 00 00 e8 ?? ?? ?? ?? 90 48 89 86`（`mov rcx,[rbp+0x200]; call <str2num>; nop; mov [rsi+0x1..],rax`）。
2. 验证上下文属于 **revokemsg sysmsg 解析函数**（引用了 `revokemsg`、`newmsgid`、`replacemsg`、`revoke_climsgid` 等字符串）。
3. 把 `mov [rsi+0x1xx],rax` 改成 `sub [rsi+0x1xx],rax`（只改 `89`→`29`）。
4. 用 capstone 反汇编验证指令完整：`sub qword ptr [rsi + 0xXXX], rax`。

**跨版本特征**：
- 模式：`call <字符串→数字>; nop; mov [obj+newmsgid偏移], rax`（newmsgid 偏移随版本变化）
- 字符串：`newmsgid`、`revokemsg`、`replacemsg`、`revoke_climsgid`
- 字段：对象偏移 +0x1A8 / 0x1C8 / 0x248（逐版本递增）

### 可复用的通配特征码（随版本变化的偏移用 `??`）

```
Search  = 48 89 86 ?? ?? ?? ?? 4C 89 AD 08 02 00 00 4C 8D 05
Replace = 48 29 86 ?? ?? ?? ?? 4C 89 AD 08 02 00 00 4C 8D 05
```

- 语义：`mov qword ptr [rsi+disp32], rax` → `sub qword ptr [rsi+disp32], rax`（`89`→`29`，其余不变）。
- `?? ?? ?? ??` = newmsgid 字段偏移（0x1A8 / 0x1C8 / 0x248，随版本变）。
- 尾部 `4C 89 AD 08 02 00 00`（`mov [rbp+0x208],r13`）+ `4C 8D 05`（`lea r8,[rip+...]`）为稳定锚点，3 个版本一致、命中唯一。
- 实测在 4.1.7.30 / 4.1.9.30 / 4.1.12.55 均可唯一命中。

---

## 六、注意事项

- 修改前务必备份：`copy Weixin.dll Weixin.dll.bak`
- **测试前必须完全退出微信**（任务管理器结束所有 `Weixin.exe` / `WeChatAppEx.exe`），再替换 DLL。
- 效果：内容原样保留，**撤回提示也不显示**（与参考实现行为一致）。
- 若需"内容保留 + 撤回提示仍显示"，需另做：保留提示插入、仅阻断原消息替换（当前未实现，可后续研究撤回提示渲染路径）。
- 本版本未发现 DLL 完整性/签名校验。

---

## 七、历史教训（勿重复踩坑）

- ❌ `sub_184A6C3B0` 中清空消息内容的 4 处指令 NOP 化 → **无效**。清空 content 不是撤回内容消失的主路径。
- ❌ `sub_182376390` 开头 `jz→jmp` → **无效**。该函数只是"构造撤回提示消息"（调用 sub_180A5DBD0 创建消息内容对象），不是撤回执行入口。
- ❌ `sub_182748510`（撤回核心）`jz→jmp` → **单独无效**。跳过撤回核心不能阻止原消息被替换。
- ❌ 两个 patch 都打（newmsgid 篡改 + 撤回核心跳过）→ 有效，但**撤回核心跳过多余**。
- ✅ **最终方案：仅 newmsgid 篡改（`sub_182362720` @ `0x182362ECD` 的 mov→sub）一个点即可**。
