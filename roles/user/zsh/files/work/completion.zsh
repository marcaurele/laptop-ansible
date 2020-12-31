# For aws-vault if present
if type "aws-vault" > /dev/null; then
	eval "$(aws-vault --completion-script-zsh)"
fi
