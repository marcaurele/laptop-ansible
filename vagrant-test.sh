#!/bin/sh -ex
ansible-playbook -i inventory-vagrant.py -i hosts-vagrant.yml playbook.yml $@
