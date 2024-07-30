#!/bin/bash

# get link
VERSION="$(curl -sL https://github.com/ventoy/Ventoy/releases | grep -E 'Ventoy .* release' | cut -d ' ' -f 6 | head -n 1)"
FILE="ventoy-"$VERSION"-linux.tar.gz"
FOLDER="$HOME/.opt"
URL="https://github.com/ventoy/Ventoy/releases/download/v"$VERSION"/$FILE"

# download
rm -rf "$FOLDER/$FILE"
mkdir -p "$FOLDER"
curl --http1.1 "$URL" --output-dir "$FOLDER" --output "$FILE"

# unpack
