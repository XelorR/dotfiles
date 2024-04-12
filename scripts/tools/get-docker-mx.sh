#!/usr/bin/env sh

wget -O docker.gpg  https://download.docker.com/linux/debian/gpg
gpg   --keyid-format 0xlong docker.gpg 2>/dev/null
gpg  --keyid-format 0xlong docker.gpg 2>/dev/null | grep -sq 0x8D81803C0EBFCD88 && sudo apt-key add docker.gpg
CODENAME=bookworm
echo "deb [arch=amd64] https://download.docker.com/linux/debian $CODENAME stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install docker-ce -y
sudo apt install apparmor -y

sudo groupadd docker
sudo usermod -aG docker $USER

sudo service docker restart
# sudo systemctl enable --now docker
