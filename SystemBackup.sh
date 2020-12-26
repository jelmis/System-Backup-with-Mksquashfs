#!/bin/bash
sudo ./findexclude.sh
#sudo fdisk -l | grep GiB
#echo welches Laufwerk soll gesichert werden sda, sdb,...
#read vol
#root verzeichnis ermitteln
vol=`sudo lsblk -lf | grep "/$" | awk '{print $1}'`  #sda2
uuid=`ls -l /dev/disk/by-uuid | grep sda2 | awk {'print $9'}`  #uuid ermitteln
part=`sudo lsblk -lf | grep "/$" | awk '{print substr($1,1,3)}'` #sda
efi=`sudo fdisk -l 2>/dev/null | grep EFI | grep $part | awk '{print $1}'` #efi ermitteln

echo $part is HDD
echo $vol is Root
echo $uuid is UUID from Root
echo $efi is EFI BOOT


sudo sfdisk -d /dev/$part >secured-partition-table.mbr # sda
sudo mount $efi /boot/efi
lastbackup=$(cat .last)
sudo mksquashfs / image.img -comp zstd -Xcompression-level 9 -ef .exclude -root-becomes $lastbackup
today=$(date +%d-%m-%Y-time-at-%H-%M)
echo $today >.last
echo $uuid >uuid.txt
