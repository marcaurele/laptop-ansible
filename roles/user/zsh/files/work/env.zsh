# aws-vault
if type aws-vault > /dev/null; then
	export AWS_VAULT_BACKEND=pass
	export AWS_VAULT_PASS_PREFIX=pix4d/aws/creds
fi
