#!/bin/bash
sudo cryptsetup luksOpen /dev/sdc1 profile
sudo mkdir /mnt/private
sudo mount -t ext4 /dev/mapper/profile /mnt/private
