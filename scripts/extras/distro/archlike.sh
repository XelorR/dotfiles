#!/usr/bin/env bash

# enabling ubuntu-like alt-tab and windows-like win-r
if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" || "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]]; then
	# assuming gnome version
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
fi

if command -v pacman &>/dev/null; then
	# enabling cachy os repos
	if [ ! -f /etc/pacman.d/cachyos-mirrorlist ]; then
		curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
		tar xvf cachyos-repo.tar.xz && cd cachyos-repo
		sudo ./cachyos-repo.sh
		cd ..
		rm -rf cachyos-repo.tar.xz cachyos-repo
	fi

	# installing packages
	sudo pacman -Syu --needed --noconfirm \
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
		neovim \
		nmap \
		npm \
		ollama \
		p7zip \
		prettier \
		proxychains \
		pyright \
		python-black \
		python-pip \
		python-pipx \
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
		vlc \
		wezterm \
		wget \
		zellij \
		zsh

	if [ -f /etc/pacman.d/chaotic-mirrorlist ]; then
		sudo pacman -Syu --needed --noconfirm \
			chaotic-aur/logseq-desktop-bin \
			chaotic-aur/nekoray \
			chaotic-aur/pika-backup \
			chaotic-aur/visual-studio-code-bin \
			chaotic-aur/yaru-gnome-shell-theme \
			chaotic-aur/yaru-gtk-theme \
			chaotic-aur/yaru-gtksourceview-theme \
			chaotic-aur/yaru-icon-theme \
			chaotic-aur/yaru-metacity-theme \
			chaotic-aur/yaru-session \
			chaotic-aur/yaru-sound-theme
	else
		if command -v paru &>/dev/null; then
			sudo paru -Syu --needed --noconfirm \
				logseq-desktop-bin
		else
			sudo pacman -Syu --needed --noconfirm \
				cachyos/vscodium
		fi

		# installing missing software via flatpak
		flatpak install -y \
			org.gnome.World.PikaBackup \
			com.logseq.Logseq

		# TODO - install nekoray
	fi
elif command -v apt &>/dev/null; then
elif command -v dnf &>/dev/null; then
elif command -v zypper &>/dev/null; then
elif command -v rpm-ostree &>/dev/null; then
elif command -v brew &>/dev/null; then
else
	# place to implement for different distros
fi

# setting up default shell
chsh -s "$(which fish)"

# setting up docker
sudo groupadd docker
sudo usermod -aG docker $USER

# solving inconsistencies with windows dual boot
timedatectl set-local-rtc 1 --adjust-system-clock