#!/usr/bin/env bash

sudo apt install ansible &&\
echo "'BECOME password' is the sudo password"
ansible-playbook install.yml --ask-become-pass
