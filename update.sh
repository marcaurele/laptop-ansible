#!/bin/sh -ex
ansible-playbook --ask-become-pass \
	--limit $(hostname -s) \
	playbook.yml $@
