#!/usr/bin/env bash

. /etc/os-release

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
	(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) &&
		sudo mkdir -p -m 755 /etc/apt/keyrings &&
		wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null &&
		sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg &&
		echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
		sudo apt update &&
		sudo apt install -y gh
elif [ "$ID" = "fedora" ]; then
	sudo dnf install 'dnf-command(config-manager)'
	sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
	sudo dnf install -y gh
elif [ "$ID_LIKE" = "arch" ]; then
    sudo pacman -Sy github-cli
fi
