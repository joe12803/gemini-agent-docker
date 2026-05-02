# Gemini Agent Docker (Final Stack) 🐳

本项目是 **Gemini + Bridge + OpenClaw** 的终极集成方案。

## 🏗️ 三层架构
1. **Gemini-Backend (8080)**: 底层模型推理。
2. **Gemini-Bridge (18789)**: 协议转换与轻量工具（搜索/时间）。
3. **OpenClaw (18790)**: **Agent 核心统帅**，支持复杂 Function Calling 和多轮对话。

## 🚀 复现步骤

### 1. 自动同步源码
克隆本仓库后，脚本会自动拉取 OpenClaw-Zero-Token 的最新代码到 `openclaw-src` 目录。

### 2. 启动全家桶
```bash
docker-compose up -d
```

### 3. 使用 OpenClaw Agent
访问 `http://localhost:18790/v1`。此时的 OpenClaw 已经预配置为使用 `gemini-bridge` 作为其大脑。

## 🛠️ 管理工具
- **添加工具**: 在 `openclaw-src/skills` 中添加你的技能脚本。
- **自定义网关**: 修改 `bridge/bridge.js`。
