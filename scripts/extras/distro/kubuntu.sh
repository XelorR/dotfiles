#!/usr/bin/env bash

sudo apt update
sudo apt install -y \
	aria2 \
	bat \
	borgbackup \
	curl \
	docker{.io,-compose} \
	eza \
	fd-find \
	ffmpeg \
	flatpak \
	fzf \
	gcc \
	git \
	gnome-shell-extension-manager \
	gnome-sushi \
	gnome-tweaks \
	golang \
	heif-{gdk-pixbuf,thumbnailer} \
	imagemagick \
	jq \
	keepassxc \
	luajit \
	magic-wormhole \
	make \
	nautilus-gtkhash \
	nautilus-image-converter \
	nautilus-wipe \
	ncdu \
	npm \
	p7zip-full \
	python3-{pip,llfuse,venv} \
	qalc \
	qbittorrent \
	qemu-kvm \
	ripgrep \
	rsync \
	tmate \
	tmux \
	ubuntu-desktop \
	virt-manager \
	vlc \
	vorta \
	wget \
	xclip \
	zsh

flatpak remote-add --user --if-not-exists \
	flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y \
	chat.delta.desktop \
	com.logseq.Logseq \
	im.riot.Riot \
	net.minetest.Minetest \
	org.telegram.desktop \
	org.wezfurlong.wezterm

bash $HOME/.local/share/chezmoi/scripts/extras/packages/neovim.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/lf.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/vscode.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/brave.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/syncthing.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/gh.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/lazygit.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/ollama.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/qe.sh

chsh -s "$(which zsh)"
