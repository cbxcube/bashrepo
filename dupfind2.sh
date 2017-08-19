#!/bin/bash

# print input argument
arg1=$1
arg2=$2

echo "$arg1"
echo "$arg2"

# check if working as superuser
if [[ $(id -u) != "0" ]]
then
  echo "You are not working as superuser. Exiting!"
  echo "USAGE : "
  echo "/home/cubic/Dropbox/scripts/bash/dupfind2.sh <search_in_folder>"
  echo ""
  echo "EXAMPLE :"
  echo "/home/cubic/Dropbox/scripts/bash/dupfind2.sh /tmp"
  exit 2
elif [[ -n $arg2 ]]
then
  echo "Too many arguments provided. Provide only folder! Exiting!"
  exit 2
elif [[ -n $arg1 ]]
then
  dirname = $arg1
fi


#echo "Enter folder where to find duplicates :"
#read dirname

echo ""
echo "Finding duplicates in" $dirname
echo ""
echo "==============================="
find $dirname -type f | 
while read vo
do
  echo `basename "$vo"`
done | awk '{arr[$0]++; next} END{for (i in arr){if(arr[i]>1){print i}}}' #>> /tmp/dups.txt


