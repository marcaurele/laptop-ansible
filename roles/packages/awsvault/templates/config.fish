# {{ ansible_managed }}
set -x AWS_VAULT_BACKEND pass
set -x AWS_VAULT_PASS_PREFIX {{ company }}/aws/creds