# Gemini Agent Docker (One-Click) 🐳

这是一个全栈 AI Agent 部署套件。通过 Docker Compose，你可以瞬间部署一套包含 **免费 Gemini 大脑** + **本地工具箱** 的完整 AI 系统。

## 🌟 核心架构
- **Backend (8080)**: 提供底层推理能力。
- **Bridge (18789)**: 协议转换，并内置了 Google 搜索 (ddgr) 和系统时钟工具。
- **OpenClaw (18789)**: 统领全局，执行复杂任务。

## 🚀 快速复现指南

### 1. 环境准备
确保你的服务器已安装 Docker 和 Docker Compose。

### 2. 配置 Cookie
将你的 Gemini Cookie 写入 `config/backend.json`。

### 3. 一键启动
```bash
git clone https://github.com/joe12803/gemini-agent-docker.git
cd gemini-agent-docker
docker-compose up -d
```

### 4. 验证 API
```bash
curl http://localhost:18789/v1/chat/completions \
-H "Content-Type: application/json" \
-d '{"messages": [{"role": "user", "content": "搜索今天的新闻"}]}'
```

## 🛠️ 定制化
你可以修改 `bridge/bridge.js` 来增加更多你需要的本地工具。
