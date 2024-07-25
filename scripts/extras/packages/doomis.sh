#!/usr/bin/env bash

rm -rf ~/.opt/doom
mkdir -p ~/.opt/doom ~/.local/bin

sh -c 'cat << EOF > ~/.local/bin/doom
#!/usr/bin/env bash

( HOME=$HOME/.opt/doom; emacs $@ )
EOF'
chmod +x ~/.local/bin/doom

if ! grep -q '.local/bin' $HOME/.bashrc; then
  echo 'export PATH=$HOME/.local/bin:$PATH' >>$HOME/.bashrc
fi
if ! grep -q '.local/bin' $HOME/.zshrc; then
  echo 'export PATH=$HOME/.local/bin:$PATH' >>$HOME/.zshrc
fi

echo 'Now Doom Emacs will be installed under ~/.opt/doom'
echo
echo You will be able to run Doom Emacs using the following command:
echo '  ( HOME=$HOME/.opt/doom; emacs --daemon )'
echo
echo To sync your configs, do the following:
echo '  ( HOME=$HOME/.opt/doom; ~/.config/emacs/bin/doom sync )'

(
  HOME=$HOME/.opt/doom
  git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
  ~/.config/emacs/bin/doom install --env -!
)
