#!/bin/bash

# include scanning of subnets with nmap
#EXAMPLES:
#  nmap -v -A scanme.nmap.org
#  nmap -v -sn 192.168.0.0/16 10.0.0.0/8
#  nmap -v -iR 10000 -Pn -p 80
#
#  - Find all ssh servers in subnet and redirect to file
#  nmap -p 22 --open -sV 10.0.0.0/24 > sshservers
#		# for home network : 
# sudo nmap -v -A 192.168.0.0/24


ipadd="192.168.0."
part="1"
max="253"



## Reporting : 
tmpfile="/tmp/.listclients.txt"
echo "Temporary file by scanvlan.sh." >> $tmpfile
## Reporting without file in variable 
discoveredlistvar=""


pingtest() {
	ping -c $singleip
		if [[ $? = True ]]; then 
				echo "$singleip pingable. Adding it to report."
				echo "$singleip >> $tmpfile"
				echo "$singleip >> $discoveredlistvar"
		else	
				echo "$singleip not reachable. Continuing with another IP.."
		fi
}
			
			


while [[ $i -le $max ]]
	do
		singleip=$ipaddr+$part
		echo "checking ip" $singleip
			#if [[ $(ping -c 1 $singleip) == False ]]; then
			#	echo "No answer from IP : $singleip"
			pingtest
			sleep1
			singleip=($singleip + 1)
			echo ""
			echo "List of discovered IPs :"
			cat "$tmpfile"
			echo " Report 2----------------"
			echo "$discoveredlistvar"
			sleep 2
done

