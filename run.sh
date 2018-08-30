#!/bin/bash

time \
ansible-playbook \
-i ./inventory.ini \
./playbook.yml

exit 0
