#!/bin/bash
user1=`users | awk '{print $1}'`
find /home /tmp /var >list.txt
cat list.txt | grep /Trash/ >.exclude
cat list.txt | grep /trash/ >>.exclude
cat list.txt | grep /var/cache/ >>.exclude
cat list.txt | grep /var/log/ >>.exclude
cat list.txt | grep /var/run/ >>.exclude
cat list.txt | grep /var/lock/ >>.exclude
cat list.txt | grep /var/lib/docker/ >>.exclude
cat list.txt | grep /var/lib/schroot/ >>.exclude
cat list.txt | grep /var/backups/ >>.exclude
cat list.txt | grep /tmp/ >>.exclude
cat list.txt | grep .cache/ >>.exclude
echo /run >>.exclude
echo /proc >>.exclude
echo /media >>.exclude
echo /mnt >>.exclude
echo /sys >>.exclude
echo /dev >>.exclude
echo /home/$user1/Dokumente >>.exclude
echo /home/$user1/Videos >>.exclude
echo /home/$user1/Bilder >>.exclude
echo /home/$user1/Downloads >>.exclude
echo /home/$user1/Vorlagen >>.exclude
echo /home/$user1/Desktop >>.exclude
echo /home/$user1/Musik >>.exclude
echo /home/$user1/Netzwerk >>.exclude
rm list.txt
