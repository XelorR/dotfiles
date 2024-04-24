#!/usr/bin/env bash

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.opt/doom/.config/emacs
~/.opt/doom/.config/emacs/bin/doom install --env -! --emacsdir ~/.opt/doom/.config/emacs

# then you can run Doom Emacs
# without affecting your configuration,
# using command like this:
# env HOME=$HOME/.opt/doom emacs &!
