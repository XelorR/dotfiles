#!/usr/bin/env bash

. /etc/os-release

if [ "$ID" = "debian" ]; then
	if [ "$VERSION_ID" = "12" ]; then
		echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
		curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg >/dev/null
	elif [ "$VERSION_ID" = "11" ]; then
		echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
		curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg >/dev/null
	elif [ "$VERSION_ID" = "10" ]; then
		echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
		curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg >/dev/null
	fi
	sudo apt update
	sudo apt install -y fish
elif [ "$ID" = "ubuntu" ]; then
	if [ "$VERSION_ID" = "24.04" ]; then
		sudo apt update
		sudo apt install -y fish
	else
		sudo apt-add-repository ppa:fish-shell/release-3
		sudo apt update
		sudo apt install -y fish
	fi
elif [ "$ID" = "fedora" ]; then
	dnf check-update
	sudo dnf install -y fish

elif [ "$ID" = "opensuse" ]; then
	sudo zypper refresh
	sudo zypper install fish

elif [ "$ID_LIKE" = "arch" ]; then
	sudo pacman -Sy fish

fi
