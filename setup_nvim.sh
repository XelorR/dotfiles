#!/usr/bin/env bash

curl -fLo ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/XelorR/dotfiles/master/mini_init.vim
curl -fLo ~/.config/nvim/colors/molokai.vim --create-dirs https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
sed -i 's/desert/molokai/g' ~/.config/nvim/init.vim

curl -fLo ~/.vimrc https://raw.githubusercontent.com/XelorR/dotfiles/master/mini_vimrc
mkdir -p ~/.vim/colors
cp ~/.config/nvim/colors/molokai.vim ~/.vim/colors/
sed -i 's/desert/molokai/g' ~/.vimrc

