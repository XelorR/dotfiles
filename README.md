# My dotfiles

## Setup oneliners

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply --ssh xelorr
```
or
```bash
sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin init --apply --ssh xelorr
```
## List and run installation scripts

[Use this script](./scripts/extras/package-installer)

## Log

Note for myself, official fedora container:
```bash
docker run -it --rm --name fedora registry.fedoraproject.org/fedora:40
```

Link Ollama with LM Studio

```bash
go install github.com/sammcj/llamalink@latest
go run github.com/sammcj/llamalink@latest -a
```
