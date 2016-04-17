#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root, use sudo "$0" instead" 1>&2
    exit 1
fi

echo "Installing Dependencies"
#apt-get update
apt-get install ansible python-passlib sshpass

echo "Copying tailsmp"
cp bin/* /usr/local/bin/
chmod -R 755 /usr/local/bin/

mkdir -p /opt/ansible/
cp -r playbook/* /opt/ansible/
chmod -R 777 /opt/ansible/

