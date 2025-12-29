#!/usr/bin/env sh
# {{ ansible_managed }}

case "$1" in
dark) COLOR=prefer-dark ;;
light) COLOR=prefer-light ;;
default) exit 1 ;;
esac

gsettings set org.gnome.desktop.interface color-scheme "$COLOR"
