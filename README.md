# My dotfiles

## Setup oneliners

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply --ssh xelorr
```
or
```bash
sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin init --apply --ssh xelorr
```

## todo

- [ ] symlinks fish, bash, zsh, tmux, spacemacs
- [ ] natable things to readme
- [ ] tmux plugins to be managed as external
- [ ] spacemacs as archive
