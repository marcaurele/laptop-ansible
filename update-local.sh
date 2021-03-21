#!/bin/sh -ex
ansible-playbook --ask-become-pass \
	--connection local \
	--limit $(hostname -s) \
	playbook.yml $@
