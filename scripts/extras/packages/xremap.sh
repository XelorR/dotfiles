#!/bin/bash

# download the binary
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

# Create systemd service file
mkdir -p $HOME/.config/systemd/user
XREMAP_PATH="$HOME/.local/bin/xremap"

cat <<EOF >$HOME/.config/systemd/user/xremap.service
[Unit]
Description=Xremap Service
[Service]
ExecStart=$XREMAP_PATH --watch $HOME/.local/share/chezmoi/dot_config/xremap/enhance.yml
[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload

# adding user to input group, to avoid using sudo

. /etc/os-release

sudo gpasswd -a $USER input
if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
	echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/input.rules
elif [ "$ID_LIKE" = "arch" ]; then
	echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/99-input.rules
else
	echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/input.rules
fi
echo udev rule added, you may need to reboot
