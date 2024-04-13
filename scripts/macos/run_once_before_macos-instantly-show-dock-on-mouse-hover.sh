#!/usr/bin/env zsh

defaults write com.apple.dock "autohide-delay" -float "0" && killall Dock
defaults write com.apple.dock launchanim -bool false
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0
defaults write -g NSWindowResizeTime -float 0.001

