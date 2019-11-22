#!/usr/bin/env bash

mkdir -p ./soft/apt_downloads

curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ./soft/Miniconda3-latest-Linux-x86_64.sh
bash ./soft/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - 
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list 

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
source /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list

sudo apt-get update
apt-get --print-uris install aria2 neovim codium brave-browser vlc yapf pylint python3-rope tldr pwgen | grep http | cut -d"'" -f2 > ./soft/apt_downloads/update.txt
wget -i ./soft/apt_downloads/update.txt -P ./soft/apt_downloads

$HOME/miniconda/bin/python3 -m pip download -d ./soft/pip_downloads_min https://s3.amazonaws.com/h2o-release/datatable/stable/datatable-0.9.0/datatable-0.9.0-cp37-cp37m-linux_x86_64.whl numpy pandas table jupyterlab jupytext autopep8 rope pylint seaborn xlrd xlwt xlsxwriter openpyxl pyyaml==5.1.2
$HOME/miniconda/bin/python3 -m pip download -d ./soft/pip_downloads_rest sklearn catboost lightgbm tensorflow xgboost plotly_express pyautogui keyboard pydotplus

wget -O ./soft/init.vim https://raw.githubusercontent.com/XelorR/dotfiles/master/mini_init.vim
