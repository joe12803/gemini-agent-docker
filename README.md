# Gemini Agent Docker (Multi-Account Isolation Edition) 🐳

本项目是基于 **GeminiWeb2API** 与 **OpenClaw (CPAMC)** 的工业化多账号管理方案，实现了 4 个（或更多）Gemini 账号的物理隔离部署，支持全自动轮询负载均衡。

## 🏗️ 核心架构
- **隔离层**: 每个账号独占一个 `Backend` + `Bridge` 容器对，完全隔离 Cookie 环境，降低关联封号风险。
- **网关层**: 使用 **OpenClaw (CPAMC)** 实现多账号聚合，对外提供统一的 OpenAI 标准接口。
- **管理层**: 内置 `manage-gemini.sh` 脚本，支持一键增删账号。

## 🚀 部署与使用

### 1. 启动服务
```bash
docker compose up -d
```
启动后将上线：
- **聚合网关**: `18790` (UI 管理面板)
- **独立实例**: `18789, 18791, 18793, 18795`

### 2. 远程 CPA/OneAPI 接入
如需在另一台服务器上调用本项目，请使用以下路径（API Key 统一为 `sk-123456`）：
- **Acc 1**: `https://gemini-api.994938.xyz/acc1/v1`
- **Acc 2**: `https://gemini-api.994938.xyz/acc2/v1`
- **Acc 3**: `https://gemini-api.994938.xyz/acc3/v1`
- **Acc 4**: `https://gemini-api.994938.xyz/acc4/v1`

## 🛠️ 账号管理脚本
使用内置脚本轻松管理实例：

```bash
# 增加新账号 (自动分配端口与生成配置)
./manage-gemini.sh add [AccountName] [Port] "[CookieString]"

# 示例
./manage-gemini.sh add NewAcc 18800 "SAPISID=xxx; ..."
```

## 🤖 支持模型清单
经过实测，本项目完美支持以下模型名称调用：
- `gemini-pro` / `gemini-1.5-pro`
- `gemini-flash` / `gemini-1.5-flash`
- `gemini-2.0-flash-exp` (极荐)
- `gemini-3.1-flash` (New!)
- `gemini-3.1-pro-high` (New!)

---

## 💡 方案优势
1. **真实物理隔离**: Cookie 不交叉，防止因某个账号异常导致全站覆没。
2. **极速响应**: 针对 Flash 模型优化，平均响应时间 < 5s。
3. **零成本扩展**: 理论上支持无限扩展账号，只要你的内存足够大。
