#!/usr/bin/env sh
# {{ ansible_managed }}

case "$1" in
dark) ICON=Adwaita-dark ;;
light) ICON=Adwaita ;;
default) exit 1 ;;
esac

gsettings set org.gnome.desktop.interface gtk-theme "$ICON"
