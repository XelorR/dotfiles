#!/bin/bash

if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" || "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]]; then
	platform="gnome"
else
	platform="x11"
fi
xremap_url=$(curl -sL https://api.github.com/repos/k0kubun/xremap/releases/latest | grep x86_64-$platform.zip | grep browser | cut -d'"' -f4)
xremap_name=$(echo $xremap_url | cut -d'/' -f9)

wget $xremap_url

mkdir -p $HOME/.local/bin/
7z x $xremap_name -O$HOME/.local/bin/
rm $xremap_name

sudo gpasswd -a $USER input
echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/input.rules
