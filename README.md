# Ansible playbook to configure my laptop

This playbook is my laptop installer done nicely. It features the possibility to install all extra requirements after having done the basic Debian installation with either a SSH connection to the new latop, or by cloning and executing this playbook. The former is the prefered way.

## First remote run

`ansible-playbook -K -i host.remote playbook.yml`

## Local runs after 1st installation

`ansible-playbook -K -c local -i host.local playbook.yml`

## Testing on a cloud provider
`ansible-playbook -i host.test playbook.yml`

## Things to do

- fix `pass` init on empty machine to rerun ansible
- fix su/sudo when installing on a fresh new laptop
- fix GPG key import with ultimate trust
- move to i3blocks (https://github.com/vivien/i3blocks)
- add package `tmate`
- flag _work_ packages and don't install them on personal laptop
- luniistore app for the kids
