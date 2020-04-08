#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import requests
from pathlib import Path

pn = Path("~/.config/nvim")
pv = Path("~/")

init = requests.get('https://raw.githubusercontent.com/XelorR/dotfiles/master/mini_init.vim').replace('desert', 'molokai')

theme = requests.get('https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim')

syntax = requests.get('https://raw.githubusercontent.com/hdima/python-syntax/master/syntax/python.vim')

vimrc = requests.get('https://raw.githubusercontent.com/XelorR/dotfiles/master/mini_vimrc').replace('desert', 'molokai')

with open((pn / 'init.vim').asposix(), 'w') as f:
    f.write(init)

with open((pn / 'colors/molokai.vim').asposix(), 'w') as f:
    f.write(theme)

with open((pn / 'syntax/python.vim').asposix(), 'w') as f:
    f.write(syntax)

with open((pv / '.vimrc').asposix(), 'w') as f:
    f.write(vimrc)

with open((pv / '.vim/colors/molokai.vim').asposix(), 'w') as f:
    f.write(theme)

with open((pv / '.vim/syntax/python.vim').asposix(), 'w') as f:
    f.write(syntax)

