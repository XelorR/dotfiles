#!/usr/bin/env bash

curl -fLo ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/XelorR/dotfiles/master/mini_init.vim
curl -fLo ~/.config/nvim/colors/molokai.vim --create-dirs https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
sed -i 's/desert/molokai/g' ~/.config/nvim/init.vim

