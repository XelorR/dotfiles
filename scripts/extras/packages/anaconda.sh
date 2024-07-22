#!/usr/bin/env sh

if ! test -f "$HOME/.anaconda3/bin/activate"; then
	aria2c https://repo.anaconda.com/archive/Anaconda3-$(curl -sL https://formulae.brew.sh/cask/anaconda | grep "Current version" | cut -d'>' -f3 | cut -d'<' -f1)-Linux-x86_64.sh && bash Anaconda3* -b -p ~/.anaconda3 && rm Anaconda3*
fi
