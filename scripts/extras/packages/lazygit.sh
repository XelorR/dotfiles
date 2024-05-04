#!/usr/bin/env bash

. /etc/os-release

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
elif [ "$ID" = "fedora" ]; then
	sudo dnf copr enable atim/lazygit -y
	sudo dnf install -y lazygit
elif [ "$ID_LIKE" = "arch" ]; then
    sudo pacman -Sy lazygit
fi
