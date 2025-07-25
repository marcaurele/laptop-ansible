# {{ ansible_managed }}
if command -sq aws-vault; and command -sq pass
    set -x AWS_VAULT_BACKEND pass
    set -x AWS_VAULT_PASS_PREFIX {{ company }}/aws/creds
end