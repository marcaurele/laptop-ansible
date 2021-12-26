# aws-vault
# {{ ansible_managed }}
if type aws-vault > /dev/null; then
	export AWS_VAULT_BACKEND=pass
	export AWS_VAULT_PASS_PREFIX={{ company }}/aws/creds
fi
