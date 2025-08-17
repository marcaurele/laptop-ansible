# {{ ansible_managed }}
set -x EDITOR vim

# Terminal mode only
set -x DEBIAN_FRONTEND noninteractive

# Extend path with local uvx and other extra tools
fish_add_path -m -g ~/.local/bin
