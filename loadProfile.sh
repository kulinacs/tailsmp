#!/bin/bash
sudo cryptsetup luksOpen /dev/sdc profile

# mounts SD card to private
sudo mkdir /mnt/private
sudo mount -t ext4 /dev/mapper/profile /mnt/private
sudo chown amnesia.amnesia /mnt/private

# copies the data from the SD card back to home
cp /mnt/private/home /
