#!/bin/bash
# put on local machine

HOST=5.135.158.225

crlock() {
touch .startlock > /dev/null
}

rmlock() {
rm .startlock > /dev/null
}


crlock2() {
touch .lock2 > /dev/null
}

rmlock2() {
rm .lock2 > /dev/null
}


check() {
ssh -q -T $HOST << EOSSH
if pgrep -x "/home/cubic/scripts/remoteapp1.sh" > /dev/null
then
    echo "Running"
    #crlock
else
    echo "Stopped"
    #rmlock 2>/dev/null
fi
EOSSH
}


check2() { 
ssh -q -T $HOST << EOSSH
if pgrep -x "/home/cubic/scripts/remoteapp2.sh" > /dev/null
then
    echo "Running"
    #crlock
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
    apppid=$(ssh $HOST ps -ef |grep remoteapp1.sh |awk '{print $2}')
    echo "APP01 PID is $apppid"
    ssh $HOST ps -ef |grep $apppid  #2&1>/dev/null
    echo "Stopped remote application"
    rmlock
fi
}


startapp2() {
if [ -e .lock2]; then
    echo "Can not start another instance. APP02 is already running"
    exit 0
else
    ssh -q $HOST /home/cubic/scripts/remoteapp2.sh 2&1>/dev/null
    echo "Started remote application APP02"
    crlock2
fi
}

# INIT :
check2
startapp2

# Not required here : 
#case "$1" in
#        start)
#            start
#            ;;
#         
#        stop)
#            stop
#            ;;
#         
#        status)
#            status anacron
#            ;;
#        restart)
#            stop
#            start
#            ;;
#        condrestart)
#            if test "x`pidof anacron`" != x; then
#                stop
#                start
#            fi
#            ;;
#         
#        *)
#            echo $"Usage: $0 {start|stop|restart|condrestart|status}"
#            exit 1
# 
#esac

#################### END OF SCRIPT ####################
# NOTES: 


#check
#startapp
#stopapp

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

