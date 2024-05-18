#!/usr/bin/env bash

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

mkdir -p $HOME/.opt $HOME/.local/bin
rm -rf $HOME/.opt/nvim

tar -C $HOME/.opt -xzf nvim-linux64.tar.gz
rm -rf nvim-linux64.tar.gz

rm -rf $HOME/.local/bin/nvim
ln -s $HOME/.opt/nvim-linux64/bin/nvim $HOME/.local/bin/nvim
