#!/usr/bin/env bash

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

mkdir -p $HOME/.opt $HOME/.local/bin
rm -rf $HOME/.opt/nvim-linux64

tar -C $HOME/.opt -xzf nvim-linux64.tar.gz
rm -rf nvim-linux64.tar.gz

rm -rf $HOME/.local/bin/nvim
ln -s $HOME/.opt/nvim-linux64/bin/nvim $HOME/.local/bin/nvim

if ! grep -q '.local/bin' $HOME/.bashrc; then
	echo 'export PATH=$HOME/.local/bin:$PATH' >>$HOME/.bashrc
fi
if ! grep -q '.local/bin' $HOME/.zshrc; then
	echo 'export PATH=$HOME/.local/bin:$PATH' >>$HOME/.zshrc
fi
