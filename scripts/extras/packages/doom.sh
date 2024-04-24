#!/usr/bin/env bash

env HOME=$HOME/.opt/doom git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
env HOME=$HOME/.opt/doom ~/.config/emacs/bin/doom install --env -!

# then you can run Doom Emacs
# without affecting your configuration,
# using command like this:
# env HOME=$HOME/.opt/doom emacs &!
