#!/bin/bash
# takes a fat formatted SD card and reformats it in LUKS
sudo -s cryptsetup -c aes-xts-plain -y -s 512 luksFormat /dev/sdc
sudo cryptsetup luksOpen /dev/sdc profile
sudo mkfs.ext4 /dev/mapper/profile

# mounts the card at /mnt/private
mkdir /mnt/private
sudo mount -t ext4 /dev/mapper/profile /mnt/private

# copies persistences to the SD card
cp -r /live/persistence/TailsData_unlocked /mnt/private

