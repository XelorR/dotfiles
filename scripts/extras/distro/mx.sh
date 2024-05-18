#!/usr/bin/env sh

#some MX Linux software installation

sudo apt install -y \
	docker{,.io,-compose} \
	fzf \
	ripgrep \
	fd-find \
	luajit \
	python3-{pip,llfuse} \
	qalc \
	systemd-sysv \
	ovmf \
	qemu-{user,system{,-gui},utils} \
	aria2 \
	gcc \
	git \
	npm \
	borgbackup \
	genisoimage \
	golang \
	make \
	ncdu \
	flatpak \
	tmate \
	tmux \
	heif-gdk-pixbuf \
	heif-thumbnailer \
	ffmpeg \
	imagemagick \
	jq \
	virt-manager \
	qbittorrent \
	keepassxc \
	remmina{,-plugin-{rdp,vnc}} \
	exa \
	p7zip-full \
	vorta \
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

chsh -s "$(which zsh)"
