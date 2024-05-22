#!/bin/bash

xremap_url=$(curl -sL https://api.github.com/repos/k0kubun/xremap/releases/latest | grep x86_64-x11.zip | grep browser | cut -d'"' -f4)
xremap_name=$(echo $xremap_url | cut -d'/' -f9)

wget $xremap_url

mkdir -p ~/.local/bin/
7z x $xremap_name -O./.local/bin/
rm $xremap_name

sudo gpasswd -a $USER input
echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/input.rules
