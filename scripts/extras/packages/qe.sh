#!/usr/bin/env bash

. /etc/os-release

# installing pre-requisites
if [[ "$ID" == "ubuntu" ]]; then
	sudo apt install -y \
		wget \
		qemu-kvm \
		genisoimage
elif [ "$ID" = "debian" ]; then
	sudo apt update
	sudo apt install -y \
		wget \
		qemu-{user,system{,-gui},utils} \
		genisoimage
elif [ "$ID" = "fedora" ]; then
	sudo dnf install -y \
		wget \
		edk2-ovmf \
		qemu-{kvm,tools} \
		genisoimage
elif [ "$ID_LIKE" = "arch" ]; then
	sudo pacman -Sy --noconfirm \
		wget \
		qemu-desktop \
		cdrkit
fi

# copying script itself
mkdir -p ~/.local/bin
wget https://raw.githubusercontent.com/XelorR/qe/main/qe -O ~/.local/bin/qe
chmod +x ~/.local/bin/qe
