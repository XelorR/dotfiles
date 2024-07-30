#!/bin/bash

# get link
VERSION="$(curl -sL https://github.com/ventoy/Ventoy/releases | grep -E 'Ventoy .* release' | cut -d ' ' -f 6 | head -n 1)"
FILE="ventoy-"$VERSION"-linux.tar.gz"
URL="https://github.com/ventoy/Ventoy/releases/download/v"$VERSION"/$FILE"

# download
rm -rf "$HOME/.opt/$FILE"
mkdir -p ~/.opt
curl --http1.1 "$URL" --output-dir "$HOME/.opt" --output "$FILE"

# unpack
