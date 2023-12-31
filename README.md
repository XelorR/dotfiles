# My dotfiles

## Setup oneliners

unix https
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply xelorr
```

unix ssh
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply git@github.com:xelorr/dotfiles.git
```

unix ssh wget version
```bash
sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin init --apply git@github.com:xelorr/dotfiles.git
```

## Migration to Chezmoi

- [x] alacritty font size difference
- [x] alacritty decorations enable for plasma
- [ ] separate plasma bindings for ubuntu (do under ubuntu)
- [ ] installing tpm for tmux
- [ ] installing spacemacs
- [x] installing lazyvim
- [ ] installing prezto
- [ ] script for xremap systemd rule in etc
- [ ] script for sshd config in etc (different arch/ubuntu)
- [ ] windows-specific --- glazewm (do under windows)
- [x] .chezmoiignore to diffirenciate macos/linux (do under mac)
- [ ] macos execute-once script to hide dock (do under macos)
- [x] software installations macos/arch/ubuntu/windows/termux
- [x] termux specific config (do under termux)
- [ ] fonts for different folders macos/linux/windows/termux
- [x] readme --- setup oneliners
