#!/bin/sh -ex
ansible-playbook -K -c local -i host.local playbook.yml $@
