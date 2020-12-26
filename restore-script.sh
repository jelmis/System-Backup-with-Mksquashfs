#!/bin/bash
clear
sudo mkdir /mnt/backups
sudo mkdir /mnt/restore
sudo fdisk -l | grep GiB
echo Auf welche Festplatte soll zurück geschrieben werden '(sda, sdb oder sdc,...)'
read volume
sudo sfdisk --force /dev/$volume <secured-partition-table.mbr
sudo umount $volume'1'
sudo umount $volume'2'
uuid=`cat uuid.txt`
sudo mkfs.fat /dev/$volume'1'
sudo mkfs.ext4 -F -U $uuid /dev/$volume'2'

sudo mount /dev/$volume'2' /mnt/restore/
sudo mkdir /mnt/restore/boot
sudo mkdir /mnt/restore/boot/efi
sudo mount /dev/$volume'1' /mnt/restore/boot/efi
sudo mount image.img /mnt/backups/
sudo mkdir /mnt/restore/dev
sudo mkdir /mnt/restore/proc
sudo mkdir /mnt/restore/sys
sudo mkdir /mnt/restore/media
sudo mkdir /mnt/restore/mnt
sudo mkdir /mnt/restore/run
cd /mnt/backups
