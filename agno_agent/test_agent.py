import os
from agno.agent import Agent
from agno.models.openai import OpenAIChat

VLLM_BASE_URL = os.getenv("VLLM_BASE_URL", "http://localhost:8000/v1")
MODEL_NAME = os.getenv("MODEL_NAME", "Qwen/Qwen2.5-32B-Instruct-AWQ")

print(f"{VLLM_BASE_URL}")

agent = Agent(
    model=OpenAIChat(
        id=MODEL_NAME,             
        base_url=VLLM_BASE_URL,    
        api_key="sk-dummy-key"     
    ),
    description="assistant chatbot",
    instructions=[
        "You are a helpful assistant chatbot."
    ],
    show_tool_calls=True,
    markdown=True
)

if __name__ == "__main__":
    print("agent is running...")
    question = "what is the capital of france?"
    print(f"user: {question}\n")
    agent.print_response(question, stream=True)
