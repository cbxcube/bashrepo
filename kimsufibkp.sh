#!/bin/bash

# backup kimsufi server to local dr server or client

serverip="5.135.158.225"
partition="/dev/sda:"
user=$(echo $USER)
#dest=$(mount|grep nfs|awk '{print $3}')
dest="/mnt/bkp/"
archive_file=
backup_files=
backup_files="/home /var/www"
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# get partition size : 
getpartds() {
echo -e "\nConnecting to $serverip\n"
request=$(ssh $user@$serverip time sudo fdisk -l |grep $partition 2>&1)
echo -e "\nssh connection......ok\nssh response........ok\n\n$request\n"
}

getpartds


# Backup the files using tar.
runbkp() {
echo -e "\nBackup of $serverip started.......ok\n"
cmd=$(tar czf $dest/$archive_file $backup_files)
#cmd
#if [ $? = 0 ] then
	print -e "Backup of $serverip completed......ok\n"
#
}

# runbkp


# Print end status message.
result() {
#if [ $?  echo echo "Backup finished" date



# Long listing of files in $dest to check file sizes.
ls -lh $dest

exit 0
