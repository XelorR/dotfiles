#!/usr/bin/env zsh

# OS check
if [[ $(uname -o) == "Darwin" ]]; then
	# macos part
	if command -v brew &>/dev/null; then
		echo Not implemented
	else
		echo No brew installation found, skipping...
	fi

elif [[ $(uname -o) == "Android" ]]; then
	# termux part

else
	# gnu linux part
	. /etc/os-release


	# enabling ubuntu-like alt-tab and windows-like win-r
	if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" || "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]]; then

		# Alt-tab, Super-grave and Super-tab
		gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Super>Above_Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Shift><Super>Above_Tab']"

		# Win-r
		gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Alt>F1', '<Super>r']"

    # Mouse and touchpad scrolling directions
		gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
		gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

		# Scrennshooting
		gsettings set org.gnome.shell.keybindings show-screenshot-ui "['Print', '<Shift><Super>s']"

		# VirtualBox - allowing to grab all keyboard input
		gsettings set org.gnome.mutter.wayland xwayland-grab-access-rules "['VirtualBox Machine']"

    # Workspaces
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Page_Up', '<Control><Alt>Left']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Page_Down', '<Control><Alt>Right']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>Page_Up', '<Control><Shift><Alt>Left']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>Page_Down', '<Control><Shift><Alt>Right']"

    gsettings set org.gnome.mutter dynamic-workspaces false
    gsettings set org.gnome.desktop.wm.preferences num-workspaces 10

    gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier "['<Control><Alt>F8']" # to solve conflict with workspace 8
    for i in $(seq 9); do
      echo Configuring desktop $i...
      gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Control><Alt><Shift>$i']"
      gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Control><Alt>$i']"
    done
    echo Configuring desktop 10...
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Control><Alt><Shift>0']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Control><Alt>0']"
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
			cronie \
			curl \
			docker \
			docker-compose \
			element-desktop \
			emacs \
			fd \
			firefox \
			fish \
			fisher \
			flatpak \
			fzf \
			gcc \
			github-cli \
			helix \
			jq \
			keepassxc \
			lazygit \
			lf \
			libreoffice-fresh \
			luajit \
			marksman \
			minetest \
			minikube \
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
			python-ipykernel \
			python-llfuse \
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
			virtualbox-guest-iso \
			vlc \
			wezterm \
			wget \
			wl-clipboard \
			zed \
			zellij \
			zsh \
    ;
    if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" || "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]]; then
      sudo pacman -Syu --needed --noconfirm \
        drawing \
        gnome-shell-extension-appindicator \
        gnome-shell-extension-arc-menu \
        gnome-shell-extension-caffeine \
        gnome-shell-extension-dash-to-dock \
        gnome-shell-extension-desktop-icons-ng \
        gnome-shell-extension-no-overview \
        gnome-shell-extensions \
        gnome-tweaks \
        nautilus-image-converter \
      ;
    fi

		if [ -f /etc/pacman.d/chaotic-mirrorlist ]; then
			sudo pacman -Syu --needed --noconfirm \
				chaotic-aur/logseq-desktop-bin \
				chaotic-aur/nekoray \
				chaotic-aur/pika-backup \
				chaotic-aur/virtualbox-ext-oracle \
				chaotic-aur/visual-studio-code-bin \
      ;
		else
			if command -v paru &>/dev/null; then
				paru -Syu --needed --noconfirm \
					visual-studio-code-bin \
					virtualbox-ext-oracle \
					logseq-desktop-bin \
        ;
			else
				sudo pacman -S --needed --noconfirm \
					cachyos/vscodium \
        ;
				flatpak install -y \
					com.logseq.Logseq \
        ;
				# TODO install virtualbox guest additions
			fi

			# installing missing software via flatpak
			flatpak install -y \
				org.gnome.World.PikaBackup \
      ;
			# TODO - install nekoray
		fi
	elif command -v apt &>/dev/null; then
		sudo apt update
	  if [[ "$ID" == "debian" || "$ID" == "kali" ]]; then
			sudo apt install -y \
        aria2 \
      ;
	  elif [[ "$ID" == "ubuntu" || "$ID_LIKE" == "ubuntu debian" ]]; then
			sudo apt install -y \
        aria2 \
        black \
        cron \
        curl \
        docker \
        docker-compose \
        emacs \
        fd-find \
        firefox \
        flatpak \
        fzf \
        gcc \
        genisoimage \
        jq \
        keepassxc \
        libreoffice \
        luajit \
        ncdu \
        nmap \
        npm \
        p7zip-full \
        pipx \
        proxychains \
        python3-ipykernel \
        python3-llfuse \
        python3-pip \
        qbittorrent \
        qemu-kvm \
        ripgrep \
        rsync \
        sshfs \
        virtualbox \
        virtualbox-ext-pack \
        virtualbox-guest-additions-iso \
        vlc \
        wget \
        wl-clipboard \
        zsh \
      ;
      if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" || "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]]; then
        sudo pacman -Syu --needed --noconfirm \
          drawing \
          gnome-shell-extension-appindicator \
          gnome-shell-extension-desktop-icons-ng \
          gnome-shell-extension-extersion-manager \
          gnome-shell-extension-ubuntu-dock \
          gnome-shell-extensions \
          gnome-sushi \
          gnome-tweaks \
          nautilus-image-converter \
          nautilus-wipe \
        ;
      fi

      for app in \
        chezmoi \
        fish \
        gh \
        helix \
        lazygit \
        lf \
        neovim \
        ollama \
        serpl \
        syncthing \
        ventoy \
        vscode \
        wezterm \
        zellij \
      ; do
        curl -sL https://bit.ly/package-installer | bash -s $app
      done

      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
			flatpak install -y \
				org.gnome.World.PikaBackup \
        com.logseq.Logseq \
        dev.zed.Zed \
        im.riot.Riot \
        net.minetest.Minetest \
        org.telegram.desktop \
      ;

	  fi
	elif command -v dnf &>/dev/null; then
		sudo dnf check-update
		sudo dnt install -y \
			aria2
	elif command -v zypper &>/dev/null; then
		sudo sypper refresh
		sudo zypper --non-interactive --no-confirm install \
			aria2
	elif command -v rpm-ostree &>/dev/null; then
		sudo rpm-ostree install --apply-live \
			aria2
	else
		# place to implement for different distros
	fi

	# setting up default shell
	chsh -s "$(which fish)"

	/bin/fish <<'EOF'
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jethrokuan/z
EOF

	# setting up docker
  for group in \
    docker \
    qemu \
    vboxusers \
  ; do
    sudo groupadd $group
    sudo usermod -aG $group $USER
  done

	sudo mkdir -p /etc/docker
	sudo sh -c 'cat <<EOF >/etc/docker/daemon.json
{
  "registry-mirrors": [
        "https://dockerhub.timeweb.cloud",
        "https://mirror.gcr.io",
        "https://huecker.io"
  ]
}
EOF'

	# solving inconsistencies with windows dual boot
	timedatectl set-local-rtc 1 --adjust-system-clock

  # using capslock as additional escape
  /usr/bin/setxkbmap -option "caps:escape"

fi
