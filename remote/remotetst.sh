#!/bin/bash
# put on local machine

HOST=xxxxxx

crlock() {
touch .startlock > /dev/null
}

rmlock() {
rm .startlock > /dev/null
}

check() {
ssh -q -T $HOST << EOSSH
if pgrep -x "/home/cubic/scripts/remoteapp1.sh" > /dev/null
then
    echo "Running"
    crlock
else
    echo "Stopped"
    #rmlock 2>/dev/null
fi
EOSSH
}

startapp() {
if [ -e .startlock ]; then
    echo "Can not start another instance. APP01 is already running"
    exit 0
else
    ssh -q $HOST /home/cubic/scripts/remoteapp1.sh 2&1>/dev/null
    echo "Started remote application APP01"
    crlock
fi
}

stopapp() {
if [ ! -e .startlock ]; then
    echo "Already stopped"
    exit 0
else
    apppid=$(ssh $HOST ps -ef |grep /home/cubic/scripts/remoteapp1.sh |awk '{print $2}')
    echo "APP01 PID is $apppid"
    ssh $HOST ps -ef |grep $apppid  2&1>/dev/null
    echo "Stopped remote application"
    rmlock
fi
}


check
startapp
stopapp

# Multiline
#VAR1="Variable 1"
#ssh $HOST '
#ls
#pwd
#if true; then
#    echo "True"
#    echo $VAR1      # <-- it won't work
#else
#    echo "False"
#fi
#' 


# heredoc ssh 
#VAR1="boo"
#ssh -T $HOST << EOSSH
#ls
#pwd
#if true; then
#  echo $VAR1
#else
#  echo "False"
#fi
#EOSSH

