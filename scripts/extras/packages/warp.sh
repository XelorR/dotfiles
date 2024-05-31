#!/usr/bin/bash

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
	wget 'https://app.warp.dev/download?package=deb' -O warp.deb
	sudo apt install -y ./warp.deb
fi
