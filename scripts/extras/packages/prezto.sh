#!/bin/bash

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
	sudo apt update
	sudo apt install -y zsh git
elif [ "$ID" = "fedora" ]; then
	dnf check-update
	sudo dnf install -y zsh git
elif [ "$ID" = "opensuse" ]; then
	sudo zypper refresh
	sudo zypper install zsh git
elif [ "$ID_LIKE" = "arch" ]; then
	sudo pacman -Sy zsh git
fi

zsh <<'EOF'
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
EOF

sudo sed -i "s|^\($USER.*\)/bin/bash|\1/bin/zsh|" /etc/passwd
