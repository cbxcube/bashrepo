#!/bin/bash
# check if argument provided (can only be or not be provided!)
#-z string - True if string is empty.
#-n string - True if string is not empty.

if [ -n $3 ]; then
  echo "argument provided ... OK"
  echo $3
  print $3
  fileName = $3
else [ -z $3 ]
  echo "argument not provided ... OK"
  #echo -n "Enter File Name : "
  echo "Enter File Name : "
  read fileName
fi
 
# make sure file exits for reading
if [ ! -f $fileName ]; then
  echo "Filename $fileName does not exists."
  exit 1
fi
 
# convert uppercase to lowercase using tr command
tr '[A-Z]' '[a-z]' < $fileName
 
# Note Bash version 4 user should use builtins as discussed above
