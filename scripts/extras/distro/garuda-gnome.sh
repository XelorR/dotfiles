#!/usr/bin/env bash

# assuming gnome version
# enabling ubuntu-like alt-tab and windows-like win-r
echo Configuring Alt-tab, Super-grave and Super-tab...
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Super>Above_Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Shift><Super>Above_Tab']"

echo Configuring Win-r...
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Alt>F1', '<Super>r']"

echo Configuring scrolling...
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

echo Configuring Super-Shift-s to make a screenshot...
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['Print', '<Shift><Super>s']"

# enabling cachy os repos
curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh

# installing packages
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
	nekoray \ # chaotic AUR
	neovim \
	nmap \
	npm \
	ollama \
	p7zip \
	pika-backup \ # chaotic AUR
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
	visual-studio-code-bin \ # chaotic AUR
	vlc \
	wezterm \
	wget \
	yaru-gnome-shell-theme \ # chaotic AUR
	yaru-gtk-theme \ # chaotic AUR
	yaru-gtksourceview-theme \ # chaotic AUR
	yaru-icon-theme \ # chaotic AUR
	yaru-metacity-theme \ # chaotic AUR
	yaru-session \ # chaotic AUR
	yaru-sound-theme \ # chaotic AUR
	zellij \
	zsh \

# setting up default shell
chsh -s "$(which fish)"

# setting up docker
sudo groupadd docker
sudo usermod -aG docker $USER

# solving inconsistencies with windows dual boot
timedatectl set-local-rtc 1 --adjust-system-clock
