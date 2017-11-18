#!/bin/bash

checksys() {
system=unknown
if [ -f /etc/redhat-release ]; then
    system=redhat
elif [ -f /etc/SuSE-release ]; then
    system=suse
elif [ -f /etc/debian_version ]; then
    system=debian
elif [ -f /etc/gentoo-release ]; then
    system=gentoo
elif [ -f /etc/arch-release ]; then
     system=arch
elif [ -f /etc/slackware-version ]; then
    system=slackware
elif [ -f /etc/lfs-release ]; then
    system=lfs
else
    system=other
fi
}

### MOVE VARIABLES AND FUNCTIONS SECTION TO .lib file and source .lib:
#source ./$HOME/.lib

# print help
arg0help() {
less << EOHELP
REMOTEAPP2(1)                            User Commands                           REMOTEAPP2(1)

NAME
       remoteapp2.sh - Run application2 on local server. Script is started by remote user over ssh.

SYNOPSIS
       remoteapp2.sh [OPTION]... [FILE]...

DESCRIPTION
       Starts application2 (while loop for true) 

OPTIONS
       start	 Start application2
       stop  	 Stop application2
       status  	 Show application2 status
       -h        Show help page
       -l        Make bash act as if it had been invoked as a login shell (see

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

ENVIRONMENT
	$APP2HOME
	    Path to home folder of remoteapp2.sh.
NOTES
       The exit() function uses a global variable that is not protected, so it is not thread-safe.

       And / Or

 	      command1 && command2

       command2  is  executed if, and only if, command1 returns an exit status
       of zero.

       An OR list has the form

              command1 || command2

EOHELP
}


# Process Input Arguments
$1=A01
$2=A03
$3=A04

if [ -z $3]; then
	echo "Too many arguments provided. Exiting"  
	exit 


crlock() {
touch .app20lock > /dev/null
echo "### DEBUG : crlock function run result :"
echo $?

}

rmlock() {
rm .app20lock > /dev/null
}


app2() {
echo "App20 started......[OK]" >> app2.log
date >> app2.log
uptime >> app2.log
checksys >> app2.log
cat app2.log
sleep 30
}


apppid=$(ps -ef |grep -iE "/bin/bash|remoteapp2.sh" |grep -v grep |awk '{print $2}')

startapp() {
if [ -e .app20lock ]; then
    echo "Can not start another instance. APP02 is already running"
    exit 0
else
    crlock
    echo "Started remote application APP02"
    echo $apppid
    app2
fi
}

stopapp() {
if [ ! -e .app20lock ]; then
    echo "APP02 already stopped"
    exit 0
else
    #apppid=$(ps -ef |grep -iE "/bin/bash|remoteapp2.sh" |grep -v grep |awk '{print $2}')
    echo "APP02 PID is $apppid"
    echo "Stopping APP02 .......[OK]" >> app2.log
    
    ps -ef |grep $apppid #2&1>/dev/null
    echo "kill -9 $apppid"
    echo "Stopped remote application APP02"
    rmlock
fi
}


startapp
echo "end of start script"
echo "begining of stop script"
stopapp

exit 0

