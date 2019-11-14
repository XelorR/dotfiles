#!/usr/bin/env bash

git config --global user.name user
git config --global user.email user@user.org

# curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ./soft/Miniconda3-latest-Linux-x86_64.sh
# curl https://www.torproject.org/dist/torbrowser/9.0.1/tor-browser-linux64-9.0.1_en-US.tar.xz -o ./soft/tor-browser-linux64-9.0.1_en-US.tar.xz

# python3 -m pip download -d ./soft/pip_downloads datatable pandas jupyterlab jupytext rope pylint autopep8 yapf pwgen tldr seaborn xlrd xlwt xlsxwriter openpyxl sklearn catboost lightgbm tensorflow xgboost fbprophet plotly_express pyautogui keyboard

# wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - 
# echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list 


# sudo apt-get --print-uris install aria2 neovim codium | grep 'http' | awk '{print$1}' | tr -d "'" > ./soft/apt_downloads/update.txt
# wget -i ./soft/apt_downloads/update.txt
sudo dpkg -i ./soft/apt_downloads/update.txt

export PATH=~/miniconda/bin/:~/.local/bin:$PATH
echo "export PATH=~/miniconda/bin/:~/.local/bin:$PATH" >> ~/.bashrc

bash ./soft/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
python3 -m pip install --user --find-links ./soft/pip_downloads datatable pandas jupyterlab jupytext rope pylint autopep8 yapf pwgen tldr seaborn xlrd xlwt xlsxwriter openpyxl pyautogui keyboard

# python3 -m pip install --user --find-links ./soft/pip_downloads sklearn catboost lightgbm tensorflow xgboost fbprophet plotly_express

for file in ./soft/vscode_extensions/*.vsix; do codium --install-extension $file; done

tar xfv ./soft/tor-browser-linux64*.tar.xz -C ~/Desktop/
