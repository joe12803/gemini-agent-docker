#!/bin/bash

ACTION=$1
NAME=$2
PORT=$3
COOKIES=$4

DOCKER_COMPOSE="/opt/gemini-agent-docker/docker-compose.yml"
CONFIG_DIR="/opt/gemini-accounts"

if [ "$ACTION" == "add" ]; then
    if [ -z "$NAME" ] || [ -z "$PORT" ] || [ -z "$COOKIES" ]; then
        echo "Usage: $0 add [name] [port] [cookies]"
        exit 1
    fi

    echo "Adding account $NAME on port $PORT..."

    # Create config file
    cat > "$CONFIG_DIR/$NAME.json" <<EOF
{
  "api_key": "***",
  "token": "",
  "cookies": "$COOKIES",
  "tokens": [],
  "proxy": "",
  "gemini_url": "",
  "gemini_home_url": "",
  "port": 8080,
  "log_file": "",
  "log_level": "info",
  "note": [
    "Configured with User Cookies - $NAME"
  ]
}
EOF

    # Add to docker-compose.yml
    cat >> "$DOCKER_COMPOSE" <<EOF

  gemini-backend-$NAME:
    image: joe1280/geminiweb2api:latest
    container_name: gemini-backend-$NAME
    volumes:
      - $CONFIG_DIR/$NAME.json:/app/config.json
    restart: always

  gemini-bridge-$NAME:
    image: joe1280/gemini-tool-bridge:latest
    container_name: gemini-bridge-$NAME
    ports:
      - "$PORT:18789"
    environment:
      - GEMINI_BACKEND=http://gemini-backend-$NAME:8080
      - API_KEY=sk-123456
      - PORT=18789
    depends_on:
      - gemini-backend-$NAME
    restart: always
EOF

    cd /opt/gemini-agent-docker && docker compose up -d "gemini-backend-$NAME" "gemini-bridge-$NAME"
    echo "Account $NAME is up on port $PORT"
else
    echo "Unknown action: $ACTION"
fi
