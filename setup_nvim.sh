#!/usr/bin/env bash

mkdir -p ~/.config/nvim/colors
wget -O ~/.config/nvim/init.vim https://raw.githubusercontent.com/XelorR/dotfiles/master/mini_init.vim
wget -O ~/.config/nvim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
sed -i 's/desert/molokai/g' ~/.config/nvim/init.vim

