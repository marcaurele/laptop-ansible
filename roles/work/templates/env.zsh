# {{ ansible_managed }}
if type aws-vault > /dev/null; then
  export KEEPER_CONFIG_FILE=~/.config/keeper/config.json
fi
