#!/usr/bin/env sh

# History from one manual OpenSuse Thumbleweed setup

# timedatectl set-local-rtc 1 --adjust-system-clock
# sudo vi /etc/passwd
# # /dev/system/root  /           btrfs  defaults,compress=zstd                      0  0
# # /dev/system/root  /root       btrfs  subvol=/@/root,compress=zstd                0  0
# # /dev/system/root  /home       btrfs  subvol=/@/home,compress=zstd                0  0
# sudo btrfs filesystem defragment -rvf -czstd /
# sudo btrfs filesystem defragment -rvf -czstd /root
# sudo btrfs filesystem defragment -rvf -czstd /home

sudo zypper install --no-confirm \
	aria2 \
	bat \
	borgbackup \
	chezmoi \
	emacs \
	eza \
	fd \
	fzf \
	gcc \
	git \
	luajit \
	make \
	ncdu \
	neovim \
	npm \
	opi \
	ripgrep \
	rsync \
	syncthing \
	tmate \
	tmux \
	w3m \
	zsh

# fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'

# if ! test -f "$HOME/.anaconda3/bin/activate"; then
# 	aria2c https://repo.anaconda.com/archive/Anaconda3-$(curl -sL https://formulae.brew.sh/cask/anaconda | grep "Current version" | cut -d'>' -f3 | cut -d'<' -f1)-Linux-x86_64.sh && bash Anaconda3* -b -p ~/.anaconda3 && rm Anaconda3*
# fi

flatpak remote-delete flathub
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y \
	chat.delta.desktop \
	com.github.tchx84.Flatseal \
	com.logseq.Logseq \
	im.riot.Riot \
	io.github.Qalculate \
	net.minetest.Minetest \
	org.keepassxc.KeePassXC \
	org.libreoffice.LibreOffice \
	org.mozilla.Thunderbird \
	org.qbittorrent.qBittorrent \
	org.telegram.desktop \
	org.videolan.VLC \
	org.wezfurlong.wezterm

opi codecs

bash $HOME/.local/share/chezmoi/scripts/extras/packages/lf.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/vscode.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/brave.sh
# bash $HOME/.local/share/chezmoi/scripts/extras/packages/gh.sh
# bash $HOME/.local/share/chezmoi/scripts/extras/packages/lazygit.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/ollama.sh
bash $HOME/.local/share/chezmoi/scripts/extras/packages/qe.sh

chsh -s "$(which zsh)"

sudo groupadd docker
sudo usermod -aG docker $USER
