#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root, use sudo "$0" instead" 1>&2
   exit 1
fi

# decrypts the SD card
sudo cryptsetup luksOpen /dev/sdc profile

# mounts SD card to private
if [ ! -d "/mnt/private" ]; then
  sudo mkdir /mnt/private
fi
sudo mount -t ext4 /dev/mapper/profile /mnt/private
sudo chown -R amnesia.amnesia /home

# copies the data from the SD card back to home
rsync -a --exclude 'Persistent' /mnt/private/amnesia /home/

# encrypts the SD card
sudo umount -l /dev/mapper/profile
sudo cryptsetup luksClose profile
echo 'Profile loaded to /home/.'
