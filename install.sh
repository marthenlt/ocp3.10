#!/usr/bin/env bash

echo " "
echo "======================================================================================================================================================================="
echo "Installation of OCP 3.10 is starting.. It might take awhile. Sit back and relax.. Do grab a cup of coffee now.."
echo "======================================================================================================================================================================="
echo "Installation prepared by. Marthen Luther "
echo " "

cp -f inventory.yaml /etc/ansible/hosts
cp -f users.htpasswd /etc/ansible/users.htpasswd

ansible-playbook playbooks/consolidated-install.yaml



