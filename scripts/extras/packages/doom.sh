#!/usr/bin/env sh

mkdir -p ~/.config
rm -rf ~/.emacs ~/.emacs.d ~/.config/emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install --env -!
