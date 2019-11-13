wget "https://github.com$(curl https://github.com/VSCodium/vscodium/releases | grep .deb | head -n 1 | awk -F\" '{print $2}')"
sudo dpkg -i codium*.deb