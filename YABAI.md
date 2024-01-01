# MacOS - tiling setup with Yabai

1. install first:

```bash
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install cmacrae/formulae/spacebar
```

2. then put configs to corresponding folders:

- .config/yabai/[yabairc](.config/yabai/yabairc)
- .config/skhd/[skhdrc](.config/skhd/skhdrc)
- .config/spacebar/[spacebarrc](.config/spacebar/spacebarrc)

3. then start services

```bash
yabai --start-service
skhd --start-service
brew services start spacebar
```

4. then [disable system integrity protection](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection)

5. and finally ensure launching `sudo yabai --load-sa` on startup

