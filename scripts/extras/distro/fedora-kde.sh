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
	genisoimage \
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
	qemu-{kvm,tools} \
	qt \
	ripgrep \
	rsync \
	syncthing \
	tmate \
	tmux \
	virt-manager \
	vlc \
	vorta \
	wl-clipboard \
	yp-tools \
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
bash $HOME/.local/share/chezmoi/scripts/extras/packages/ollama.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/qe.sh

chsh -s "$(which zsh)"

# kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,,invokeShortcut,Overview"
# qdbus org.kde.KWin /KWin reconfigure
