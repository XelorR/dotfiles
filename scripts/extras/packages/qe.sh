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

# ensuring that it's in PATH
if ! grep -q '.local/bin' $HOME/.bashrc; then
  echo 'export PATH=$HOME/.local/bin:$PATH' >>$HOME/.bashrc
fi
if ! grep -q '.local/bin' $HOME/.zshrc; then
  echo 'export PATH=$HOME/.local/bin:$PATH' >>$HOME/.zshrc
fi
