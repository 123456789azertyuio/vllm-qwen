#!/bin/bash
echo "Démarrage Vast.ai ..."

echo "Installation vLLM Open WebUI..."
pip install vllm open-webui

echo "Démarrage Model Qwen 35B..."
python3 -m vllm.entrypoints.openai.api_server \
    --model Qwen/Qwen2.5-32B-Instruct-AWQ \
    --quantization awq \
    --tensor-parallel-size 1 \
    --max-model-len 8192 &

sleep 15

echo " ChatGPT Interface..."
export OPENAI_API_BASE_URL=http://localhost:10000/v1
export WEBUI_AUTH=False
open-webui serve --host 0.0.0.0 --port 10080
