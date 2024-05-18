#!/usr/bin/env bash

if [[ "$(uname -m)" == "x86_64" ]]; then
	url="https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz"
elif [[ "$(uname -m)" == "aarch64" ]]; then
	url="https://github.com/gokcehan/lf/releases/latest/download/lf-linux-arm64.tar.gz"
fi
archiveName="$(echo $url | cut -d'/' -f9)"

mkdir -p "$HOME/.local/bin"
rm -rf "$HOME/.local/bin/lf"
wget $url
tar xf $archiveName -C "$HOME/.local/bin/"
rm -rf $archiveName
