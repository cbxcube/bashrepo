#!/bin/bash
# cubic (c) 2016 

runtest="/home/cubic/Dropbox/scripts/python/tespeed2/speedtest-cli"
logfilesdir="/home/cubic/Dropbox/scripts/python/monspeed/monspeed2logs"

timestamp=$(date -d "today" +"%Y-%m-%d-%H:%M")
logfile="bandwidth-"$timestamp".log"
number="1"
#testnr=$number"========================"$timestamp;
testnr=$number" ................... "$timestamp;

echo "debug 1"
echo $runtest
echo $logfilesdir
echo $timestamp
echo $logfile
echo "end of debug 1"
echo ""
echo ""

echo "            ___.   .__                                           "
echo "  ____  __ _\_ |__ |__| ____  "
echo "_/ ___\|  |  \ __ \|  |/ ___\   "
echo "\  \___|  |  / \_\ \  \  \___              "
echo " \___  >____/|___  /__|\___  >  "
echo "     \/          \/        \/   "
echo "___.                      .___       .__    .___ __  .__     "
echo "\_ |__ _____    ____    __| _/_  _  _|__| __| _//  |_|  |__        "
echo " | __ \\__  \  /    \  / __ |\ \/ \/ /  |/ __ |\   __\  |  \       "
echo " | \_\ \/ __ \|   |  \/ /_/ | \     /|  / /_/ | |  | |   Y  \  "
echo " |___  (____  /___|  /\____ |  \/\_/ |__\____ | |__| |___|  /  "
echo "     \/     \/     \/      \/  (c)2016 cubic \/           \/    "

echo "===================================================================="
echo "Starting bandwidth monitoring..."
echo ""
echo "Log files are collected in :"
echo " /home/cubic/Dropbox/scripts/python/monspeed/monspeed2logs"
echo ""
echo "Empty space on filesystem : "
df -h . |awk '{print $4}'


echo "Checking bandwidth each 15 minutes ..."
echo "===================================================================="
echo ""
echo "checknr               date"
echo "--------------------------------------"
while true; 
do cd $logfilesdir && touch $logfile; 
echo $testnr >> $logfile;
echo $testnr;
date >> $logfile;
$runtest >> $logfile;
sleep 900;
#sleep 2; 
timestamp=$(date -d "today" +"%Y-%m-%d-%H:%M");
logfile="bandwidth-"$timestamp".log";
number=$((number+1));
#testnr=$number"========================"$timestamp;
testnr=$number" ................... "$timestamp
done
