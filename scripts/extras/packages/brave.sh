#!/usr/bin/env bash

. /etc/os-release

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    sudo apt install -y curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt update
    sudo apt install -y brave-browser

elif [ "$ID" = "fedora" ]; then
    sudo dnf install dnf-plugins-core
    sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

    sudo dnf install -y brave-browser

elif [ "$ID" = "opensuse" ]; then
    sudo zypper install curl
    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
    sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

    sudo zypper install brave-browser

elif [ "$ID_LIKE" = "arch" ]; then
    paru -Sy brave-bin

fi
