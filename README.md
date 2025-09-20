# InstallRoma native

This is a shell script that automates the installation and configuration of ROMA
 with OpenRouter API and the Deepseek model.

It sets up:

- .env with your API key

- sentient.yaml with your API key

- agents.yaml with the correct model

- starts both backend and frontend servers

## Requirements

Linux or macOS terminal (WSL)

git installed

bash shell

An OpenRouter API key

## Installation
```
git clone https://github.com/sheriifMahadi/installRoma.git
cd installRoma
chmod +x install_roma.sh

```

## Usage

```
./install_roma.sh <OPENROUTER_API_KEY>

```

This will start up a backend and frontend server \
Backend API at: http://localhost:5000 \
Frontend App at: http://localhost:3000

Go ahead and use the frontend to interact with ROMA
