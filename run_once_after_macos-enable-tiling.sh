#!/usr/bin/env sh

yabai --start-service
skhd --start-service
brew services start spacebar

sudo yabai --load-sa
