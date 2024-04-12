#!/usr/bin/env sh

cd ~/Downloads
wget https://gitlab.com/kalilinux/packages/kali-themes/-/archive/kali/master/kali-themes-kali-master.tar.bz2
tar jxvf kali-themes-kali-master.tar.bz2 
mkdir -p ~/.local/share/{themes,icons}
cp -r kali-themes-kali-master/share/themes/* ~/.local/share/themes/
cp -r kali-themes-kali-master/share/icons/* ~/.local/share/icons/

