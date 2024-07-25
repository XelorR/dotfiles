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

  cat <<'EOF' >~/.config/doom/config.el

;; Set the system locale to US English
(set-locale-environment "en_US.UTF-8")
(setq system-time-locale "C")

;; Navigation
(map! :n "H" #'previous-buffer
      :n "L" #'next-buffer
      :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right
      )
EOF

  ~/.config/emacs/bin/doom install --env -!
)
