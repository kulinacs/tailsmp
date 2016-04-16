#!/bin/bash
apt-get install cryptsetup
cryptsetup luksOpen /dev/sdc1 profile
mkdir /mnt/private
mount -t ext4 /dev/mapper/profile /mnt/private
