#!/usr/bin/env bash

rm -rf ~/.opt/spacemacs
mkdir -p ~/.opt/spacemacs ~/.local/bin

(
  HOME=$HOME/.opt/spacemacs
  git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
)

sh -c 'cat << EOF > ~/.local/bin/spacemacs
#!/usr/bin/env bash

( HOME=$HOME/.opt/spacemacs; emacs $@ )
EOF'
chmod +x ~/.local/bin/spacemacs

if ! grep -q '.local/bin' $HOME/.bashrc; then
  echo 'export PATH=$HOME/.local/bin:$PATH' >>$HOME/.bashrc
fi
if ! grep -q '.local/bin' $HOME/.zshrc; then
  echo 'export PATH=$HOME/.local/bin:$PATH' >>$HOME/.zshrc
fi

echo Done!
echo
echo Now you can run Spacemacs using the following command:
echo '  ( HOME=$HOME/.opt/spacemacs; emacs --daemon )'
