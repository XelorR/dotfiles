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
	golang \
	heif-{gdk-pixbuf,thumbnailer} \
	imagemagick \
	jq \
	keepassxc \
	luajit \
	make \
	ncdu \
	npm \
	p7zip-full \
	python3-{pip,llfuse} \
	qalc \
	qbittorrent \
	qemu-kvm \
	ripgrep \
	rsync \
	tmate \
	tmux \
	virt-manager \
	vlc \
	vorta \
	wget

flatpak remote-add --user --if-not-exists \
	flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y \
	chat.delta.desktop \
	com.logseq.Logseq \
	im.riot.Riot \
	net.minetest.Minetest \
	org.telegram.desktop \
	org.wezfurlong.wezterm