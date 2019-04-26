#!/bin/bash

# Checks md5 of files found in USERs HOME
# 
# ADD : interactive exit to ask if keep temporary file

USER="$USER"
HOME="$HOME"
FILEDMP="/tmp/homecheck.txt"
FILEMD5="/tmp/homecheckmd5.txt"
FILECSV="/tmp/homecheck.csv"
FILEDUP="/tmp/homecheckdup.csv"

search() {
printf "\nSearching $HOME directory ...\nThis might take some time...\n"
find $HOME -type b,c,p,f,l,s
}

dumpres() {
printf "\nDumping results to temporary file ...\nThis might also take some time...\n"
search > $FILEDMP
}

result1() {
# number of found items 
printf "\nTotal items found in $HOME\n"
wc -l $FILEDMP
}

createmd5() {
printf "\nComputing MD5 checksums for all files in $HOME...\nThis can take a while.\n"
for i in `cat $FILEDMP`
	do md5sum $i >> $FILEMD5
done
printf "\nMD5 checksum of files in $HOME saved in $FILEMD5.\n"
}

convertcsv() {
printf "\nConverting to CSV file$FILECSV...\n"
awk 'BEGIN{print "MD5CHECKSUM;FILE"}{print $1";"$2}' $FILEMD5 > $FILECSV
printf "\nCSV file $FILECSV created.\n"
}

duplicates() {
printf "\nFinding duplicates files...\n"
# Maybe AWK? 
#
#awk 'BEGIN{print "MD5CHECKSUM;FILE"}{print $1";"$2}' $FILECSV > $FILEDUP
# 
# Trying with sort and uniq
sort $FILECSV |uniq -c > $FILEDUP
printf "\nList of $HOME directory duplicates saved in $FILEDUP.\n"
# Test also find duplicates from $FILEMD5
touch /tmp/homecheckdup2.csv
sort $FILEMD5 |uniq -c > /tmp/homecheckdup2.csv
printf "\nTemporary test of /tmp/homecheckdup2.csv\n"
}

# INIT
# get files
dumpres
# create md5 for each file
createmd5
# create table file (csv?) "FILENAME:MD5SUM"
convertcsv
# find duplicated lines in output.csv
duplicates
# list identiffied duplicate files
#cat $FILEDUP
#cat /tmp/homecheckdup2.csv\n
# wipe tmp files
#rm $FILEDMP
exit 0
