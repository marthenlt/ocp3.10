#!/bin/bash

rm -f /etc/yum.repos.d/open_ocp-ha-lab.repo

subscription-manager unsubscribe --all

subscription-manager unregister

subscription-manager register --username= --password= --force

subscription-manager refresh

subscription-manager list --available --matches "Red Hat OpenShift Container Platform" | egrep -e "Subscription Name" -e "Pool ID" -e "Available"

subscription-manager attach --pool=

subscription-manager repos --disable="*"

yum repolist

ansible all -m shell -a 'subscription-manager repos \
    --enable="rhel-7-server-rpms" \
    --enable="rhel-7-server-extras-rpms" \
    --enable="rhel-7-server-ose-3.10-rpms" \
    --enable="rhel-7-server-ansible-2.4-rpms"

yum install wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct

yum update -y

# systemctl reboot

yum install openshift-ansible

yum update -y



ansible all -m shell -a 'rm -f /etc/yum.repos.d/open_ocp-ha-lab.repo'

ansible all -m shell -a 'subscription-manager unsubscribe --all'

ansible all -m shell -a 'subscription-manager unregister'

ansible all -m shell -a 'subscription-manager register --username= --password= --force'

ansible all -m shell -a 'subscription-manager refresh'

ansible all -m shell -a 'subscription-manager list --available --matches "Red Hat OpenShift Container Platform" | egrep -e "Subscription Name" -e "Pool ID" -e "Available"'

ansible all -m shell -a 'subscription-manager attach --pool='

ansible all -m shell -a 'subscription-manager repos --disable="*"'

ansible all -m shell -a 'yum repolist'

## ansible all -m shell -a 'yum-config-manager --disable \*'

ansible all -m shell -a 'subscription-manager repos \
    --enable="rhel-7-server-rpms" \
    --enable="rhel-7-server-extras-rpms" \
    --enable="rhel-7-server-ose-3.10-rpms" \
    --enable="rhel-7-server-ansible-2.4-rpms"'

ansible all -m shell -a 'yum install wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct'

ansible all -m shell -a 'yum update -y'

#ansible all -m shell -a 'systemctl reboot'

ansible all -m shell -a 'yum install openshift-ansible'

ansible all -m shell -a 'yum install docker-1.13.1'

ansible all -m shell -a 'cat <<EOF > /etc/sysconfig/docker-storage-setup
VG=docker-vg
EOF'

ansible all -m shell -a 'docker-storage-setup'

ansible all -m shell -a 'systemctl enable docker'

ansible all -m shell -a 'systemctl start docker'

ansible all -m shell -a 'systemctl is-active docker'



