#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root, use sudo "$0" instead" 1>&2
    exit 1
fi

echo "Installed Dependencies"
apt-get install python-pip
pip install nikola
pip install ansible

echo "Copying tailsmp"
cp bin/* /usr/local/bin
chmod -R +rx /usr/local/bin

mkdir /opt/ansible/
cp playbook/* /opt/ansible
chmod -R +rw /opt/ansible

