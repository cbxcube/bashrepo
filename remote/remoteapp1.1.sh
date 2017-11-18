#!/bin/bash

HOME="/home/$(echo $USER)/scripts/
LOG="$HOME/appl1.log"


touch appl.log
date >> app1.log
uptime >> app1.log
sleep 30

exit 0

