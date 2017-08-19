#!/bin/bash

# find duplicates in folder 

# temporary files :
tmpfile=".dupslist.tmp"
tmpfile1=".dupslist2.tmp"
tmpfile2=".dupslist3.tmp"
sudo rm "$tmpfile"
sudo rm "$tmpfile1"
sudo rm "$tmpfile2"
touch "$tmpfile"
touch "$tmpfile1"
touch "$tmpfile2"
echo " Enter folder where I should find duplicates : "
read dirlocation

echo -e " \n"
echo "----------------------------------------------"
echo "             D U P L I C A T E S "
echo "----------------------------------------------"

find "$dirlocation" -type f |sed 's_.*/__' | sort| uniq -d|
	while read fileName
		do
			find $dirlocation -type f |grep "$fileName"|
				while read listFiles
					do
						echo "$listFiles" 2>&1 | tee -a $tmpfile
			done
done

## remove spaces from temp file
sed 's/ /\\ /g' "$tmpfile" > "$tmpfile1"


echo "----------------------------------------------"
echo "               D E T A I L S "
echo "----------------------------------------------"
#for i in $(cat "$tmpfile1")
#	do
#		ls -la "$i"
#done
#for i in  $(cat .dupslist2.tmp)
#for i in  $(cat "$tmpfile1")
#	do 
#		$(ls -la "$i")
#done
IFS=$'\n'
for line in $(cat $tmpfile)
	do 
		echo "$line" >> $tmpfile2
		ls -lah "$line"
done

echo "----------------------------------------------"
echo "              C H E C K S U M " 
echo "----------------------------------------------"
for i in $(cat $tmpfile2)
	do
		md5sum "$i" |uniq -c
done


# remove tmp file
sudo rm $tmpfile 
sudo rm $tmpfile1
sudo rm $tmpfile2
