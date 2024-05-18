#!/usr/bin/env sh

# Define Ollama installation path
mkdir -p $HOME/.local/bin
OLLAMA_PATH="$HOME/.local/bin/ollama"

# Download and install Ollama
wget https://ollama.com/download/ollama-linux-amd64 -O $OLLAMA_PATH && chmod +x $OLLAMA_PATH

# Create systemd service file for Ollama
mkdir -p $HOME/.config/systemd/user
cat << EOF > $HOME/.config/systemd/user/ollama.service
[Unit]
Description=Ollama Service
After=network-online.target
[Service]
ExecStart=$OLLAMA_PATH serve
Restart=always
RestartSec=3
[Install]
WantedBy=default.target
EOF

# Reload systemd, enable and start the service
systemctl --user daemon-reload
systemctl --user enable --now ollama
