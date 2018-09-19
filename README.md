# Ansible playbook to configure my laptop

## First remote run

`ansible-playbook -K -i host.remote playbook.yml`

## Local runs after 1st installation

`ansible-playbook -K -c local -i host.local playbook.yml`