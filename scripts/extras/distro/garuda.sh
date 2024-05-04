#!/usr/bin/env sh

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
	genisoimage \
	git \
	go \
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
	npm \
	pycharm-community-edition \
	python-llfuse \
	qalculate \
	qbittorrent \
	qemu-desktop \
	ripgrep \
	rsync \
	syncthing \
	tmate \
	tmux \
	virt-manager \
	vlc \
	vorta \
	w3m \
	wezterm \
	zsh \
	{element,telegram}-desktop \
	chaotic-aur/antimicrox \
	chaotic-aur/brave-bin \
	chaotic-aur/github-cli \
	chaotic-aur/logseq-desktop-bin \
	chaotic-aur/rpcs3-git \
	chaotic-aur/ventoy-bin \
	chaotic-aur/visual-studio-code-bin \
	chaotic-aur/xboxdrv

sudo chsh -s $(which zsh)
