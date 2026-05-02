# Gemini Agent Docker (OpenClaw-Zero-Token Edition) 🐳

本项目是 **Gemini + Bridge + OpenClaw-Zero-Token** 的全栈集成方案，旨在实现极致的“零成本”大模型工具调用环境。

## 🏗️ 架构组件
1. **Gemini-Backend**: 实现 Gemini 网页版至 OpenAI 标准接口的转换。
2. **Gemini-Bridge**: 核心适配层，为 OpenClaw 提供稳定的 API 响应与轻量级内置工具。
3. **OpenClaw-Zero-Token**: **真正的统帅层**，一个极其强大的 Agent 框架，支持全自动工具发现、本地脚本执行与多轮复杂推理。

## 🚀 极速部署

### 1. 准备源码
确保在当前目录下拥有 `openclaw-zero-token` 的完整源码：
```bash
git clone https://github.com/joe12803/openclaw-zero-token.git
```

### 2. 启动全栈
```bash
docker-compose up -d
```

### 3. 测试
访问 `http://localhost:18790/v1`。你现在拥有了一个基于免费 Gemini 大脑、具备无限扩展工具能力的 OpenClaw Agent。

---

## 💡 为什么使用 OpenClaw-Zero-Token？
它是目前最优秀的零成本 Agent 框架之一，能完美调度本地 Python 脚本、Shell 命令以及各种 API。通过本项目的 Docker 编排，你不再需要担心繁琐的环境配置。
