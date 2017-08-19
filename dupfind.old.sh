#!/bin/bash

# find duplicates in folder 

echo " Enter folder where I should find duplicates : "
read dirlocation

echo -e " \n"
echo -e " \n"
echo "----------------------------------------------"
echo "             D U P L I C A T E S "
echo "----------------------------------------------"


GETDUPS=$("find $dirlocation -type f |sed 's_.*/__' | sort| uniq -d|")

#find $dirlocation -type f |sed 's_.*/__' | sort| uniq -d|
$GETDUPS
while read fileName
do
#find $dirlocation -type f |grep "$fileName" |read listfiles
find $dirlocation -type f |grep "$fileName" 
#echo $listfiles
done

echo "----------------------------------------------"
echo "                 D E T A I L S "
echo "----------------------------------------------"
for i in $listfiles
do
ls -l $i
done

