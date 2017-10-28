#!/bin/bash
#
# Generate txt file with list of Bash projects. File will be used for kimsufi:wikimedia article automated update


WDIR="~/Dropbox/scripts/bash"
myuser=$(echo $USER)

# Check user : 
#whoamichk() {
#if [ myuser -ne cubic ]then

# Generate file : ls > bashhome.txt^C
makelist() {
cd $WDIR
ls > bashhome.txt
}


# Runtime :
if [ $myuser -ne "cubic" ]

