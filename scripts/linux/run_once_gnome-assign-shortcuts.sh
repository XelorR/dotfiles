#!/bin/bash

# gsettings list-recursively org.gnome.desktop.wm.keybindings | grep to-workspace

if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" || "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]]; then
	echo GNOME detected!
	if command -v gsettings &>/dev/null; then
		echo gsettings available!
		gsettings set org.gnome.mutter dynamic-workspaces false
		gsettings set org.gnome.desktop.wm.preferences num-workspaces 10

		# keyboard shortcuts
		for i in $(seq 9); do
			echo Configuring desktop $i...
			gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Control><Alt><Shift>$i']"
			gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Control><Alt>$i']"
		done
		echo Configuring desktop 10...
		gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Control><Alt><Shift>0']"
		gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Control><Alt>0']"

		echo Configuring Alt-tab and Super-tab...
		gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
		echo Configuring Win-r...
		gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Alt>F1', '<Super>r']"

		echo Configuring Super-Shift-s ta make a screenshot...
		gsettings set org.gnome.shell.keybindings show-screenshot-ui "['Print', '<Shift><Super>s']"
		echo Done!
	fi
fi
