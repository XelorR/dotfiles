#!/bin/bash

if ! command -v nvim &>/dev/null; then
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

	mkdir -p $HOME/.opt $HOME/.local/bin
	rm -rf $HOME/.opt/nvim-linux64

	tar -C $HOME/.opt -xzf nvim-linux64.tar.gz
	rm -rf nvim-linux64.tar.gz

	rm -rf $HOME/.local/bin/nvim
	ln -s $HOME/.opt/nvim-linux64/bin/nvim $HOME/.local/bin/nvim
fi

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
