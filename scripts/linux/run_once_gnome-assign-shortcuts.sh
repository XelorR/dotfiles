#!/bin/bash

# gsettings list-recursively org.gnome.desktop.wm.keybindings | grep to-workspace

if [ "$XDG_CURRENT_DESKTOP" == "GNOME" ]; then
	if command -v gsettings &>/dev/null; then
		gsettings set org.gnome.mutter dynamic-workspaces false
		gsettings set org.gnome.desktop.wm.preferences num-workspaces 10

		# keyboard shortcuts
		for i in $(seq 9); do
			gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Control><Super><Shift>$i']"
			gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Control><Super>$i']"
		done
		gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Control><Super><Shift>0']"
		gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Control><Super>0']"

		gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"

		gsettings set org.gnome.shell.keybindings show-screenshot-ui "['Print', '<Shift><Super>s']"
	fi
fi
