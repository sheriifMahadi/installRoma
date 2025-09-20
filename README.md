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

An OpenRouter API key (See below on how to get one)

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


## Getting an API key from openrouter
Visit https://openrouter.ai/

create an account 

then go to https://openrouter.ai/settings/keys 

create an api key and save it somewhere because it wont appear again

then call the script like in the example below 

example 
```
./install_roma.sh sk-or-1234567890abcdef

```
