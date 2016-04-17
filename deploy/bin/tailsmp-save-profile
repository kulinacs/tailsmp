#!/bin/bash
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root, use sudo "$0" instead" 1>&2
  exit 1
fi

sudo cryptsetup luksOpen /dev/sdc profile

# mounts SD card to private
if [ ! -d "/mnt/private" ]; then
  sudo mkdir /mnt/private
fi
sudo mount -t ext4 /dev/mapper/profile /mnt/private
sudo chown -R amnesia.amnesia /mnt/private

#saves home folder to SD card
rm -rf /mnt/private/amnesia
rsync -a --exclude 'Persistent' /home/amnesia /mnt/private

# encrypts the SD card
sudo umount -l /dev/mapper/profile
sudo cryptsetup luksClose profile
echo 'Profile saved.'
