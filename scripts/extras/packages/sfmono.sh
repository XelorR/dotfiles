#!/bin/bash

if [ "$(uname)" = "Darwin" ]; then
	FONTS=$HOME/Library/Fonts
else
	FONTS=$HOME/.fonts
fi

wget https://github.com/xelorr/SFMono-Nerd-Font-Ligaturized/releases/latest/download/sf.tar.xz
mkdir -p $FONTS
tar xvf sf.tar.xz -C $FONTS/
rm sf.tar.xz
