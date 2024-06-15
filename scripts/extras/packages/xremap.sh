#!/bin/bash

# download the binary
if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" || "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]]; then
	platform="gnome"
elif [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
	platform="kde"
elif [ "$XDG_CURRENT_DESKTOP" = "sway" ]; then
	platform="wlroots"
else
	platform="x11"
fi
xremap_url=$(curl -sL https://api.github.com/repos/k0kubun/xremap/releases/latest | grep x86_64-$platform.zip | grep browser | cut -d'"' -f4)
xremap_name=$(echo $xremap_url | cut -d'/' -f9)
wget $xremap_url
mkdir -p $HOME/.local/bin/
7z x $xremap_name -O$HOME/.local/bin/
rm $xremap_name

# Create basic config if not exists
if [ ! -e $HOME/.config/xremap/config.yml ]; then
	mkdir -p $HOME/.config/xremap
	cat <<CONFIG >$HOME/.config/xremap/config.yml
modmap:
  - name: Modifiers
    remap:
      CapsLock: Esc
  - name: notepads
    application:
      only: [TextEditor, kate]
    remap:
      Control-p: Up
      Control-n: Down
      Control-f: Right
      Control-b: Left
      Control-a: Home
      Control-e: End
      Control-d: Delete

      Alt-left: home
      Alt-right: end
      Alt-up: Control-home
      Alt-down: Control-end
      Alt-Backspace: [Shift-home, Backspace]
      Super-Backspace: Control-Backspace
      Alt-Delete: [Shift-end, Delete]
      Super-Delete: Control-Delete

      Alt-a: Control-a
      Alt-b: Control-left
      Alt-c: Control-c
      Alt-d: Control-Delete
      Alt-e: Control-e
      Alt-f: Control-right
      Alt-g: Control-g
      Alt-h: Control-h
      Alt-i: Control-i
      Alt-j: Control-j
      Alt-k: Control-k
      Alt-l: Control-l
      Alt-m: Control-m
      Alt-n: Control-n
      Alt-o: Control-o
      Alt-p: Control-p
      Alt-q: Alt-F4
      Alt-r: Control-r
      Alt-s: Control-s
      Alt-t: Control-t
      Alt-u: Control-u
      Alt-v: Control-v
      Alt-w: Control-w
      Alt-x: Control-x
      Alt-y: Control-y
      Alt-z: Control-z
CONFIG
fi

# Create systemd service file
mkdir -p $HOME/.config/systemd/user
XREMAP_PATH="$HOME/.local/bin/xremap"
cat <<SERVICE >$HOME/.config/systemd/user/xremap.service
[Unit]
Description=Xremap Service
[Service]
ExecStart=$XREMAP_PATH --watch $HOME/.config/xremap/config.yml
[Install]
WantedBy=default.target
SERVICE

systemctl --user daemon-reload
systemctl enable --now --user xremap

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
