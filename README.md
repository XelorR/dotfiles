# My dotfiles

## Setup oneliners

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply --ssh xelorr
```
or
```bash
sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin init --apply --ssh xelorr
```

## Log

History from one manual OpenSuse Thumbleweed setup

```bash
#!/usr/bin/env sh

timedatectl set-local-rtc 1 --adjust-system-clock 
sudo vi /etc/passwd
# /dev/system/root  /           btrfs  defaults,compress=zstd                      0  0
# /dev/system/root  /root       btrfs  subvol=/@/root,compress=zstd                0  0
# /dev/system/root  /home       btrfs  subvol=/@/home,compress=zstd                0  0
sudo btrfs filesystem defragment -rvf -czstd /
sudo btrfs filesystem defragment -rvf -czstd /root
sudo btrfs filesystem defragment -rvf -czstd /home

sudo zypper install --no-confirm fish fzf ripgrep eza bat make luajit gcc npm syncthing tmux tmate w3m ncdu borgbackup rsync git aria2 emacs neovim opi fd chezmoi

fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'

if ! test -f "$HOME/.anaconda3/bin/activate"; then
	aria2c https://repo.anaconda.com/archive/Anaconda3-$(curl -sL https://formulae.brew.sh/cask/anaconda | grep "Current version" | cut -d'>' -f3 | cut -d'<' -f1)-Linux-x86_64.sh
	bash Anaconda3* -b -p ~/.anaconda3
	rm Anaconda3*
fi

flatpak remote-delete flathub
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y chat.delta.desktop com.github.tchx84.Flatseal com.logseq.Logseq im.riot.Riot net.minetest.Minetest org.keepassxc.KeePassXC org.libreoffice.LibreOffice org.mozilla.Thunderbird org.qbittorrent.qBittorrent org.telegram.desktop org.videolan.VLC org.wezfurlong.wezterm io.github.Qalculate

opi vscode
opi codecs
```

Some experimental Garuda installation:
```bash
#!/usr/bin/env sh

paru -Syu appimagelauncher aria2 bat borgbackup chezmoi dconf-editor debugedit doublecmd-gtk2 emacs extra/code eza fd fish foliate freerdp fzf gcc git gnome-shell-extension-{caffeine,appindicator} gnome-text-editor go jq keepassxc lazygit libheif libreoffice-fresh lf luajit make minetest neovim nerd-fonts-sf-mono npm ollama outline-client-appimage podman{,-compose,-docker} pycharm-community-edition python-llfuse qalculate-gtk qbittorrent remmina ripgrep rsync steam-native-runtime syncthing thunderbird tigervnc tmate tmux toolbox ttf-hack-nerd ttf-meslo-nerd virt-manager vlc w3m wezterm {element,telegram}-desktop chaotic-aur/brave-bin chaotic-aur/displaylink chaotic-aur/heroic-games-launcher-bin chaotic-aur/logseq-desktop-bin chaotic-aur/protonvpn-gui chaotic-aur/rpcs3-git chaotic-aur/ventoy-bin chaotic-aur/yaru-{gtk,gnome-shell,icon}-theme
```
