#!/usr/bin/env bash

. /etc/os-release

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
	sudo apt install -y curl \
		gnupg ca-certificates git \
		gcc-multilib g++-multilib cmake libssl-dev pkg-config \
		libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
		libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev \
		libxcursor-dev
        curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh
        cargo install --git https://github.com/neovide/neovide
elif [ "$ID" = "fedora" ]; then
	sudo dnf install -y fontconfig-devel freetype-devel libX11-xcb libX11-devel libstdc++-static libstdc++-devel
	sudo dnf groupinstall -y "Development Tools" "Development Libraries"
        curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh
        cargo install --git https://github.com/neovide/neovide
elif [ "$ID_LIKE" = "arch" ]; then
    sudo pacman -Sy neovide
fi

