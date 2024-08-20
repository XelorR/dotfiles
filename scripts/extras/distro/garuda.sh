#!/usr/bin/env bash

sudo pacman -Syu --noconfirm \
	aria2 \
	bash-language-server \
	chezmoi \
	curl \
	docker \
	docker-compose \
	element-desktop \
	emacs \
	fd \
	firefox \
	flatpak \
	fzf \
	github-cli \
	gnome-shell-extension-caffeine \
	gnome-shell-extension-dash-to-dock \
	gnome-shell-extensions \
	gnome-tweaks \
	helix \
	jq \
	keepassxc \
	lazygit \
	lf \
	libreoffice-fresh \
	marksman \
	minetest \
	minikube \
	nautilus-image-converter \
	ncdu \
	nekoray \
	neovim \
	nmap \
	npm \
	ollama \
	p7zip \
	pika-backup \
	prettier \
	proxychains \
	pyright \
	python-black \
	python-pip \
	qbittorrent \
	qemu-desktop \
	ripgrep \
	rsync \
	serpl \
	sshfs \
	sushi \
	syncthing \
	telegram-desktop \
	virtualbox \
	visual-studio-code-bin \
	vlc \
	wezterm \
	wget \
	yaru-gnome-shell-theme \
	yaru-gtk-theme \
	yaru-gtksourceview-theme \
	yaru-icon-theme \
	yaru-metacity-theme \
	yaru-session \
	yaru-sound-theme \
	zellij \
	zsh \

chsh -s "$(which fish)"

sudo groupadd docker
sudo usermod -aG docker $USER
