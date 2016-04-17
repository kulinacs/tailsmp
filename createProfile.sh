#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root, use sudo "$0" instead" 1>&2
   exit 1
fi

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

# encrypts the SD card
sudo umount -l /dev/mapper/profile
sudo cryptsetup luksClose profile
