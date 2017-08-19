# on local :
#################################

now=$(date +"%m_%d_%Y")


# mount nfs and cd there :
#################################
# mount -t nfs 5.135.158.225:/home/nfs/exports /media/kimsufirsync
# cd /media/kimsufirsync
# mkdir $now

# backup by rsync to local folder /backup/12_29_2016
#################################
# sudo rsync -aAXv --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude=/lost+found / /backup/12_29_2016


# alternative : 
#################################
# # tar -cvf /var/tmp/u01.tar .		# this will be backup file with all permissions and owners/groups
# tar -tvf /var/tmp/u01.tar			# this will list the content of tar file
