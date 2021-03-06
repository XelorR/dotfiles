#!/usr/bin/env bash

git config --global user.name user
git config --global user.email user@user.org
git config --global credential.helper store

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - 
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list 
sudo dpkg -i ./soft/apt_downloads/*.deb
for file in ./soft/vscode_extensions/*.vsix; do codium --install-extension $file; done

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
source /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list

export PATH=$HOME/miniconda/bin:$HOME/.local/bin:$PATH
echo "export PATH=$HOME/miniconda/bin:$HOME/.local/bin:$PATH" >> ~/.bashrc

bash ./soft/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
$HOME/miniconda/bin/python3 -m pip install --user ./soft/pip_downloads_min/*

mkdir -p ~/.config/nvim
cp soft/init.vim ~/.config/nvim/init.vim

