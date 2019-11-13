#!/usr/bin/env bash

git config --global user.name user
git config --global user.email user@user.org

# curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ./soft/Miniconda3-latest-Linux-x86_64.sh
# curl https://az764295.vo.msecnd.net/stable/86405ea23e3937316009fc27c9361deee66ffbf5/code_1.40.0-1573064499_amd64.deb -o ./soft/vscode.deb
# curl https://www.torproject.org/dist/torbrowser/9.0.1/tor-browser-linux64-9.0.1_en-US.tar.xz -o ./soft/tor-browser-linux64-9.0.1_en-US.tar.xz
# python3 -m pip download -d ./soft/pip_downloads datatable pandas jupyterlab jupytext rope pylint autopep8 yapf pwgen tldr seaborn xlrd xlwt xlsxwriter openpyxl sklearn catboost lightgbm tensorflow xgboost

export PATH=~/miniconda/bin/:~/.local/bin:$PATH
echo "export PATH=~/miniconda/bin/:~/.local/bin:$PATH" >> ~/.bashrc

bash ./soft/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
python3 -m pip install --user --find-links ./soft/pip_downloads datatable pandas jupyterlab jupytext rope pylint autopep8 yapf pwgen tldr seaborn xlrd xlwt xlsxwriter openpyxl sklearn catboost lightgbm tensorflow xgboost

sudo dpkg -i ./soft/vscode.deb
for file in ./soft/vscode_extensions/*.vsix; do code --install-extension $file; done
# code --install-extension vscodevim.vim
# code --install-extension ms-python.python
# code --install-extension msrvida.vscode-sanddance
# code --install-extension pkief.material-icon-theme
# code --install-extension eamodio.gitlens

tar xfv ./soft/tor-browser-linux64*.tar.xz -C ~/Desktop/
