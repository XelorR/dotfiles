#!/usr/bin/env bash

git config --global user.name user
git config --global user.email user@user.org

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

python3 -m pip install --user -U datatable pandas jupyterlab jupytext rope pylint autopep8 yapf pwgen tldr seaborn xlrd xlwt xlsxwriter openpyxl
# python3 -m pip install --user sklearn catboost lightgbm tensorflow xgboost

echo "export PATH=~/.local/bin:$PATH" >> ~/.bashrc

curl https://az764295.vo.msecnd.net/stable/86405ea23e3937316009fc27c9361deee66ffbf5/code_1.40.0-1573064499_amd64.deb -o vscode.deb
sudo dpkg -i vscode.deb
code --install-extension vscodevim.vim
code --install-extension ms-python.python
code --install-extension msrvida.vscode-sanddance
code --install-extension pkief.material-icon-theme

