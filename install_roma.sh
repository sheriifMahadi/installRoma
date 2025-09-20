#!/bin/bash
# Usage: ./install_roma.sh <OPENROUTER_API_KEY>
# Prepares ROMA config files with API key and model, then runs setup.sh --native
set -e

API_KEY=$1

if [ -z "$API_KEY" ]; then
    echo "Error: OpenRouter API key required."
    echo "Usage: $0 <OPENROUTER_API_KEY>"
    exit 1
fi

echo ">> Using API key: $API_KEY"

# --- Clone ROMA if not present in repo ---
if [ ! -d "ROMA" ]; then
    echo ">> Cloning ROMA repository..."
    git clone https://github.com/sentient-agi/ROMA.git
else
    echo ">> ROMA already exists, skipping this step"
fi

cd ROMA

# --- Copy example env file (or create one) ---
if [ -f ".env.example" ]; then
    echo ">> Copying .env.example to .env"
    cp .env.example .env
else
    echo ">> No .env.example found, creating empty .env"
    touch .env
fi

# --- Set OpenRouter API key in .env ---
if grep -q "^OPENROUTER_API_KEY=" .env 2>/dev/null; then
    sed -i "s|^OPENROUTER_API_KEY=.*|OPENROUTER_API_KEY=$API_KEY|g" .env
else
    echo "OPENROUTER_API_KEY=$API_KEY" >> .env
fi
echo ">> .env updated with OPENROUTER_API_KEY"

# --- Update sentient.yaml (root) with API key ---
if [ -f "sentient.yaml" ]; then
    sed -i "s|api_key: \"your-openrouter-key\"|api_key: \"$API_KEY\"|g" sentient.yaml
    echo ">> sentient.yaml (root) updated with OpenRouter API key"
else
    echo ">> Warning: sentient.yaml not found at root, skipping"
fi

# --- Update agents.yaml with model id ---
AGENTS_PATH="src/sentientresearchagent/hierarchical_agent_framework/agent_configs/agents.yaml"
if [ -f "$AGENTS_PATH" ]; then
    sed -i 's|model_id:.*".*"|model_id: "openrouter/deepseek/deepseek-chat-v3.1:free"|g' "$AGENTS_PATH"
    echo ">> agents.yaml model_id updated to deepseek-chat-v3.1:free"
else
    echo ">> Warning: agents.yaml not found at $AGENTS_PATH, skipping"
fi

# --- Run setup.sh --native ---
if [ -f "setup.sh" ]; then
    echo ">> Running setup.sh --native ..."
    chmod +x setup.sh
    ./setup.sh --native
else
    echo ">> Error: setup.sh not found in ROMA directory!"
    exit 1
fi

# --- Final info ---
echo
echo "ROMA installation and startup complete!"
echo "Access here:"
echo "  Backend API:   http://localhost:5000"
echo "  Frontend App:  http://localhost:3000"
