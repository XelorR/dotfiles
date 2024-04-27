#!/bin/bash

sudo dnf install -y \
	aria2 \
	bat \
	borgbackup \
	docker{,-compose} \
	edk2-ovmf \
	emacs \
	eza \
	fd-find \
	fzf \
	gcc \
	git \
	golang \
	jq \
	keepassxc \
	libheif \
	luajit \
	make \
	minetest \
	ncdu \
	npm \
	p7zip \
	python-pip \
	qalc \
	qbittorrent \
	qemu-kvm \
	qemu-tools \
	ripgrep \
	rsync \
	syncthing \
	tmate \
	tmux \
	virt-manager \
	vlc \
	vorta \
	wl-clipboard \
	zsh \
	ImageMagick

flatpak remote-add --user --if-not-exists \
	flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y \
	chat.delta.desktop \
	com.logseq.Logseq \
	org.telegram.desktop \
	org.wezfurlong.wezterm

bash $HOME/.local/share/chezmoi/scripts/extras/packages/vscode.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/brave.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/gh.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/lazygit.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/neovide.sh

sudo chsh -s $(which zsh)
