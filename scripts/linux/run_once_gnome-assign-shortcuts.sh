#!/bin/bash

# gsettings list-recursively org.gnome.desktop.wm.keybindings | grep to-workspace

if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" || "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]]; then
	echo GNOME detected!
	if command -v gsettings &>/dev/null; then
		echo gsettings available!
		echo Configuring some system wide settings...
		gsettings set org.gnome.mutter dynamic-workspaces false
		gsettings set org.gnome.desktop.wm.preferences num-workspaces 10
		gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false
		# gsettings set org.gnome.gnome-screenshot auto-save-directory file://$HOME/Desktop

		# keyboard shortcuts
		echo Ensuring to have 'toggle-maximized' configured...
		gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Alt>F10']"
		echo Ensuring Ctrl-Alt-left/rigth cycle windows...
		gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Page_Up', '<Super><Alt>Left', '<Control><Alt>Left']"
		gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Page_Down', '<Super><Alt>Right', '<Control><Alt>Right']"
		gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>Page_Up', '<Super><Shift><Alt>Left', '<Control><Shift><Alt>Left']"
		gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>Page_Down', '<Super><Shift><Alt>Right', '<Control><Shift><Alt>Right']"

		for i in $(seq 9); do
			echo Configuring desktop $i...
			gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Control><Alt><Shift>$i']"
			gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Control><Alt>$i']"
		done
		echo Configuring desktop 10...
		gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Control><Alt><Shift>0']"
		gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Control><Alt>0']"

		echo Configuring Alt-tab, Super-grave and Super-tab...
		gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Super>Above_Tab']"
		gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Shift><Super>Above_Tab']"

		echo Configuring Win-r...
		gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Alt>F1', '<Super>r']"

		echo Configuring launchers...
		gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Control><Alt>t', '<Super>t']"
		gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
		# gsettings set gsettings set org.gnome.mutter overlay-key ''
		gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>w', '<Alt>Space']"
		gsettings set org.gnome.shell.keybindings toggle-application-view "['<Super>a']"

		echo Configuring Super-Shift-s to make a screenshot...
		gsettings set org.gnome.shell.keybindings show-screenshot-ui "['Print', '<Shift><Super>s']"
		echo Done!
	fi
fi
