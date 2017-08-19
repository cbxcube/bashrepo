#!/bin/bash
#-z string - True if string is empty.
#-n string - True if string is not empty.

# print input argument
#print "$2"
#echo "$2"
#print $?

# vars
#ifile="$2"
#ifile="dummy"
#echo "$ifile"
#print "$ifile"
#
# eval
if [[ -n $2 ]]
then
  if [[ $2 -eq "--help" ]] || [[ $2 -eq "-h" ]]
  then
#	 echo $?
     echo "Usage: foo.sh <input file>"
     echo "Example: foo.sh /tmp/file01.txt"
#	 echo $?
  else [[ -z $2 ]]
#	 echo $?
	 echo "No argument provided for <input file>. Continue..."
	 echo "User interaction will be required ..."
	 echo ""
     echo -n "Enter Input File Name : "
	 read inputFile
	 echo $?
	 $ifile = $inputFile
  fi
fi

echo "printing Input File..."
echo $ifile


  
