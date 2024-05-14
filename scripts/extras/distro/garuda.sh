#!/usr/bin/env bash

paru -Syu \
	appimagelauncher \
	aria2 \
	bat \
	borgbackup \
	chezmoi \
	docker{,-compose} \
	emacs \
	eza \
	fd \
	ffmpeg \
	fzf \
	gcc \
	git \
	github-cli \
	go \
	gwenview \
	imagemagick \
	jq \
	keepassxc \
	lazygit \
	lf \
	libheif \
	libreoffice-fresh \
	luajit \
	make \
	minetest \
	neovide \
	neovim \
	npm \
	pycharm-community-edition \
	python-llfuse \
	qalculate-qt \
	qbittorrent \
	qemu-desktop \
	ripgrep \
	rsync \
	syncthing \
	tmate \
	tmux \
	unzip \
	virt-manager \
	visual-studio-code-bin \
	vlc \
	vorta \
	w3m \
	wezterm \
	zsh \
	cdrkit \
	{element,telegram}-desktop \
	chaotic-aur/antimicrox \
	chaotic-aur/brave-bin \
	chaotic-aur/logseq-desktop-bin \
	chaotic-aur/rpcs3-git \
	chaotic-aur/ventoy-bin \
	chaotic-aur/xboxdrv

sudo chsh -s "$(which zsh)"

kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,,invokeShortcut,Overview"
qdbus org.kde.KWin /KWin reconfigure
