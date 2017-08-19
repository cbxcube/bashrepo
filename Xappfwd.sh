#!/bin/bash

# This will forward GUI applications from Kimsufi
# 
# Xeyes, IRC,...

echo " Starting Xeyes from kimsufi"
echo ""

ssh -X cubic@kimsufi 'xeyes &'
sleep 10
echo "done"

echo " Starting Firefox from kimsufi"
sleep 1
echo ""
ssh -X cubic@kimsufi 'gnome-www-browser &'

sleep 10
exit 0
