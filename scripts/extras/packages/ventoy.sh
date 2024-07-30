#!/bin/bash

# get link
VERSION="$(curl -sL https://github.com/ventoy/Ventoy/releases | grep -E 'Ventoy .* release' | cut -d ' ' -f 6 | head -n 1)"
URL="https://github.com/ventoy/Ventoy/releases/download/v"$VERSION"/ventoy-"$VERSION"-linux.tar.gz"
FILE="ventoy-"$VERSION"-linux.tar.gz"

# download
rm -rf "$FILE"
mkdir -p ~/.opt
curl --http1.1 "$URL" --output-dir "$HOME/.opt" --output "$FILE"

# unpack
