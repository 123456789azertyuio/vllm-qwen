#!/bin/bash
echo "Démarrage Vast.ai"
pip install open-webui

python3 -m vllm.entrypoints.openai.api_server \
    --model Qwen/Qwen3.5-35B-A3B \
    --quantization awq \
    --tensor-parallel-size 1 \
    --max-model-len 8192 &

sleep 15

export OPENAI_API_BASE_URL=http://localhost:8000/v1
export WEBUI_AUTH=False
open-webui serve --host 0.0.0.0 --port 8080