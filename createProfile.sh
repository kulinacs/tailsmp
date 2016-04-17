#!/bin/bash
# takes a FAT formatted SD card and reformats it in LUKS
sudo cryptsetup -c aes-xts-plain -y -s 512 luksFormat /dev/sdc
sudo cryptsetup luksOpen /dev/sdc profile
sudo mkfs.ext4 /dev/mapper/profile

# mounts the card at /mnt/private
mkdir /mnt/private
sudo mount -t ext4 /dev/mapper/profile /mnt/private
sudo chown amnesia.amnesia /mnt/private

# copies current home folder to the SD card
cp -rP /home /mnt/private

