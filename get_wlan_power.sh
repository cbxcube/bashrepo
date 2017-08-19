#!/bin/bash

# Welcome screen:
#pause(){
#   read -p "  \n; * * * WLAN and ETH Interfaces Statistics\n; 
#   Press [Enter] key to continue..." fackEnterKey
#}

# OS Calls:
#listwlanpwr="$(iwconfig wlan[0-9])" 2>&2
#listwlan="$(iwconfig wlan[0-9])"
#listeth="$(iwconfig wlan[0-9])" 2>&2
listwlanpwr="/sbin/iwconfig"
listwlan="/sbin/ifconfig"
listeth=$listwlan

# UI:
header=" # # # # # # # # # # # # # # # # # # # # "

# Devices variables:
iwname="wlan"
enname="eth"

iwid=0
enid=0
iwidmax=9
enidmax=9

#Dynamic device ID functions:
iwdev=$iwname$iwid
endev=$enname$enid
iwdevincr=$iwid+1	# Increment from 0 to 9 (wlan0-9)
endevincr=$enid+1

# PRINT WLAN 0
#if [ -e "/etc/network/if-up.d/"	]; then
echo "show wlan0"
$listwlanpwr $iwdev


# FUNCTIONS:
showiwpwr() {
if [ $iwdevincr =~ ^[$iwname1-9]+$ ]; then
		echo "DEBUG:showiwpwr wlan1-9"
		echo "Scanning device : $iwdevincr"
		echo "$header"
		$($listwlanpwr $iwdev)
		$iwdevincr=$iwdevincr+1
else	
		echo "Completed ..."
fi
}
			
increasedev() {
	$iwdevincr=$iwdevincr+1
}


# RUN:
echo "		1. Wireles Interfaces Power"
while true
	do
		showiwpwr
		increasedev
done
