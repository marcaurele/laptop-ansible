# Ansible playbook to configure my laptop

This playbook is my laptop installer done nicely. It features the possibility to install all extra requirements after having done the basic Debian installation with either a SSH connection to the new latop, or by cloning and executing this playbook. The former is the prefered way.

## First remote run

`ansible-playbook -K -i host.remote playbook.yml --vault-password-file=...`

## Local runs after 1st installation

`ansible-playbook -K -c local -i host.local playbook.yml --vault-password-file=...`

## Testing on a cloud provider
`ansible-playbook -i host.test playbook.yml --vault-password-file=...`

## Things to do

- configure crontab to auto fetch update
- fix su/sudo when installing on a fresh new laptop
- fix GPG key import with ultimate trust
