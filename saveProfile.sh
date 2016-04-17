#!/bin/bash
sudo cryptsetup luksOpen /dev/sdc profile

# mounts SD card to private
sudo mkdir /mnt/private
sudo mount -t ext4 /dev/mapper/profile /mnt/private
sudo chown -R amnesia.amnesia /mnt/private

#saves home folder to SD card
rm -rf /mnt/private/home
cp /home/amnesia -rP /mnt/private
