#!/bin/bash
echo "Start ..."

if [ ! -f .env ]; then
    cp .env.example .env
fi

docker compose up -d

echo "Deployment"
echo "Vllm loading Qwen 3.5..."
echo "docker logs -f vllm_backend to check"