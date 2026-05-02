FROM node:20-slim

RUN apt-get update && apt-get install -y git python3 make g++ && rm -rf /var/lib/apt/lists/*

WORKDIR /app
# 可以在构建时直接拉取，或者挂载
COPY . .
RUN npm install

EXPOSE 18790
CMD ["node", "openclaw.mjs", "gateway", "run", "--bind", "lan", "--port", "18790", "--force"]
