#!/bin/bash

# do full fs backup from running system to kimsufi : 

mountcmd() {
	sudo mount -t nfs 5.135.158.225:/home/nfs/exports /media/kimsufirsync
}

umountcmd() {
	sudo umount /media/kimsufirsync
}

now=$(date +"%m_%d_%Y")

echo "Creating mountpoint if not exist"

if [[ -e /media/kimsufirsync ]]; then
	print "Filesystem /media/kimsufirsync exists. Mounting..."
	mountcmd 
else
	mkdir /media/kimsufirsync
	print "Filesystem /media/kimsufirsync not found! Creating it..."
	mountcmd
fi


echo " NFS Mounted - checking free space :"
echo ""
sudo df -h /media/kimsufirsync
echo ""
echo " Listing content of NFS :"
sudo ls -l /media/kimsufirsync
echo ""
echo " Create actual backup directory and CD :"


cd /media/kimsufirsync
sudo mkdir $now
sudo cd $now

echo ""
echo " New folder for backup created in :"
pwd
echo ""
echo $now
sleep 2 


# Veriffy if in destination folder on kimsufi :

# if [[ pwd = kimsufi ...

# backup command : 
# rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /path/to/backup/folder

# By using the -aAX set of options, the files are transferred in archive mode which ensures that symbolic links, devices, permissions, ownerships, modification times, ACLs, and extended attributes are preserved, assuming that the target file system supports the feature.

# The --exclude option causes files that match the given patterns to be excluded. The contents of /dev, /proc, /sys, /tmp, and /run are excluded in the above command, because they are populated at boot, although the folders themselves are not created. /lost+found is filesystem-specific. The command above depends on brace expansion available in both the bash and zsh shells. When using a different shell, --exclude patterns should be repeated manually. Quoting the exclude patterns will avoid expansion by the shell, which is necessary, for example, when backing up over SSH. Ending the excluded paths with * ensures that the directories themselves are created if they do not already exist. 


# cleanup 
echo "Cleanup tasks..."
echo ""
echo "Unmounting NFS ..."
sudo cd ~
sudo umount /media/kimsufirsync
sleep 5
sudo df /media/kimsufirsync

echo ""
echo "END of backup :"
echo $now


### ADDITIONAL RSYNC OPTIONS : 
##############
# You may want to include additional rsync options, such as the following. See rsync(1) for the full list.
#If you use many hard links, consider adding the -H option, which is turned off by default due to its memory expense; however, it should be no problem on most modern machines. Many hard links reside under the /usr/ directory.
#    You may want to add rsync's --delete option if you are running this multiple times to the same backup folder. In this case make sure that the source path does not end with /*, or this option will only have effect on the files inside the subdirectories of the source directory, but it will have no effect on the files residing directly inside the source directory.
#    If you use any sparse files, such as virtual disks, Docker images and similar, you should add the -S option.
#    The --numeric-ids option will disable mapping of user and group names; instead, numeric group and user IDs will be transfered. This is useful when backing up over SSH or when using a live system to backup different system disk.
#    Choosing --info=progress2 option instead of -v will show the overall progress info and transfer speed instead of the list of files being transferred.



### RESTORE : 
##############

# If you wish to restore the backup, use the same rsync command that was executed but with the source and destination reversed. 


### BOOT REQUIREMENTS : 
##############
# Having a bootable backup can be useful in case the filesystem becomes corrupt or if an update breaks the system. The backup can also be used as a test bed for updates, with the testing repo enabled, etc. If you transferred the system to a different partition or drive and you want to boot it, the process is as simple as updating the backup's /etc/fstab and your bootloader's configuration file.

#This section assumes that you backed up the system to another drive or partition, that your current bootloader is working fine, and that you want to boot from the backup as well.


### Update the fstab
##############

#Without rebooting, edit the backup's fstab by commenting out or removing any existing entries. Add one entry for the partition containing the backup like the example here:

#/dev/sdaX    /             ext4      defaults                 0   1

#Remember to use the proper device name and filesystem type.


### Update the bootloader's configuration file
##############


#For Syslinux, all you need to do is duplicate the current entry, except pointing to a different drive or partition.
#Tip: Instead of editing syslinux.cfg, you can also temporarily edit the menu during boot. When the menu shows up, press the Tab key and change the relevant entries. Partitions are counted from one, drives are counted from zero.

#For GRUB, it is recommended that you automatically re-generate the main configuration file. If you want to freshly install all grub files to somewhere other than /boot, such as /mnt/newroot/boot, use the --boot-directory flag.

#Also verify the new menu entry in /boot/grub/grub.cfg. Make sure the UUID is matching the new partition, otherwise it could still boot the old system. Find the UUID of a partition as follows:

# lsblk -no NAME,UUID /dev/sdb3

#where you substitute the desired partition for /dev/sdb3. To list the UUIDs of partitions grub thinks it can boot, use grep:

# grep UUID= /boot/grub/grub.cfg

# First boot
##############

# Reboot the computer and select the right entry in the bootloader. This will load the system for the first time. All peripherals should be detected and the empty folders in / will be populated.

# Now you can re-edit /etc/fstab to add the previously removed partitions and mount points. 
