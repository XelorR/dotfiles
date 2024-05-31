#!/usr/bin/bash

. /etc/os-release

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
	sudo apt-get install -y wget gpg
	wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor >warpdotdev.gpg
	sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
	sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
	rm warpdotdev.gpg
	sudo apt update && sudo apt install warp-terminal
elif [[ "$ID" = "fedora" || "$ID" = "opensuse" ]]; then
	sudo rpm --import https://releases.warp.dev/linux/keys/warp.asc
	sudo sh -c 'echo -e "[warpdotdev]\nname=warpdotdev\nbaseurl=https://releases.warp.dev/linux/rpm/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://releases.warp.dev/linux/keys/warp.asc" > /etc/yum.repos.d/warpdotdev.repo'
	sudo dnf install -y warp-terminal
elif [ "$ID_LIKE" = "arch" ]; then
	wget 'https://app.warp.dev/download?package=pacman' -O warp.pkg.tar.zst
	sudo pacman -U ./warp.pkg.tar.zst
	rm warp.pkg.tar.zst
fi
