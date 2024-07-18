#!/usr/bin/env bash

rm -rf ~/.opt/doom
mkdir -p ~/.opt/doom
( HOME=$HOME/.opt/doom; git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs )
( HOME=$HOME/.opt/doom; ~/.config/emacs/bin/doom install --env -! )

echo Done!
echo Now you can run Doom Emacs using the following command:
echo '( HOME=$HOME/.opt/doom; emacs --daemon )'
