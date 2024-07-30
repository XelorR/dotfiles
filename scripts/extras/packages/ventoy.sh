#!/bin/bash

VERSION="$(curl -sL https://github.com/ventoy/Ventoy/releases | grep -E 'Ventoy .* release' | cut -d ' ' -f 6 | head -n 1)"
URL="https://github.com/ventoy/Ventoy/releases/download/v"$VERSION"/ventoy-"$VERSION"-linux.tar.gz"

mkdir -p ~/.opt
echo $URL
