# My dotfiles

## Setup oneliners

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply --ssh xelorr
```
or
```bash
sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin init --apply --ssh xelorr
```

## Nice things here

### Universal tiling

### Universal keybinding

### Configurations for all common shells

## todo

- [x] symlinks fish, bash, zsh, tmux, spacemacs
- [ ] notable things to readme
- [x] tmux plugins to be managed as external
- [ ] colors for fish tide
- [ ] find the file which stores tide theme for fish config
- [ ] add declarative omf installation
- [x] windows adaptation
- [ ] windows scoop Setup
- [ ] windows declarative package installation
- [ ] windows powershell configuration
- [x] exchange symlinks with sources: .spacemacs, alacritty, nvim
- [ ] zprezto for mac and linux, ohmyzsh for termux
