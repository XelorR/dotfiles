# My dotfiles

## Setup oneliners

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply git@github.com:xelorr/dotfiles.git
```
or
```bash
sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin init --apply git@github.com:xelorr/dotfiles.git
```

## Migration to Chezmoi

- [x] alacritty font size difference
- [x] alacritty decorations enable for plasma
- [x] separate plasma bindings for ubuntu (do under ubuntu)
- [x] installing tpm for tmux
- [x] installing spacemacs
- [x] installing lazyvim
- [x] installing prezto
- [x] script for xremap systemd rule
- [ ] script for sshd config in etc (different arch/ubuntu)
- [x] windows-specific --- glazewm (do under windows)
- [x] .chezmoiignore to diffirenciate macos/linux (do under mac)
- [x] macos execute-once script to hide dock (do under macos)
- [x] software installations macos/arch/ubuntu/windows/termux
- [x] termux specific config (do under termux)
- [x] fonts for different folders macos/linux/windows/termux
- [x] readme --- setup oneliners
- [x] declarative package installation darwin/arch/debian/android, https://chezmoi.io/user-guide/advanced/install-packages-declaratively/
- [ ] install correct xremap version depending on X11/Wayland (Linux only, obviously)
