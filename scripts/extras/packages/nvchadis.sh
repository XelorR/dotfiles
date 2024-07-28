#!/bin/bash

if ! command -v nvim &>/dev/null; then
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
fi

rm -rf ~/.opt/nvchad
mkdir -p ~/.opt/nvchad ~/.local/bin
if [ -f ~/.gitconfig ]; then
  ln -s ~/.gitconfig ~/.opt/nvchad/.gitconfig
fi

cat <<'EOF' >~/.local/bin/nvchad
#!/usr/bin/env bash

( HOME=$HOME/.opt/nvchad; nvim $@ )
EOF
chmod +x ~/.local/bin/nvchad

(
  HOME=$HOME/.opt/nvchad

  git clone https://github.com/NvChad/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
)
