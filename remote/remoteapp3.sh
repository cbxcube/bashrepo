#!/bin/bash
#
# PUT ON REMOTE SERVER
#  
# Remote Application 03 
# Should be started  under local system user

# VARIABLES
HOME="/home/$(echo $USER)/scripts/"
LOG="$HOME/appl3.log"
LOCK="$HOME/.appl3.lock"
debugid="1"
app3pid=""


# FUNCTIONS
checklog() {
if [ -f $LOG ]; then
	date >> $LOG
	printf "APPL3 log file : $LOG already exists and will be appended with new entries." >> $LOG
else
	touch $LOG
	printf "APPL3.log file not found in APPL3 home. Creating empty log file." >> $LOG
fi
}

debugres() {
# Can be called from new line after command or with "||" on one line
# Example : cmd1 || debugres
echo "~~~ DEBUG ~~~ : Exit code of operation ID $debugid = $?"
let debugid="$debugid+1"
}

appl3init() {
	yes > /dev/null 2>&1 &
	app3pid=$!
	debugres
	echo "$app3pid" > $LOCK
	debugres
	printf " APPL3INIT: - - - APPL3 RUNNING as $app3pid" >> $LOG
} 

appl3kill() {
if [ -z $app3pid ]; then 
	app3pid="$(cat $LOCK)"
fi
	kill $app3pid
	debugres
	yes | rm $LOCK
	printf " APPL3KILL: - - - APPL3 STOPPED $app3pid\nAPPL3 lock file removed.\n" >> $LOG
} 

appl3start() {
if [ -f $LOCK ]; then
	printf "Lock file detected. APPL3 is already running\nExiting.\n" >> $LOG
	debugres
	exit 1
else
	touch $LOCK 
	debugres

	printf "Lock file created in : $LOCK\n ~ ~ ~ \n ~ ~ ~\nStarting APPL3\n">> $LOG
	debugres

	appl3init &
        printf "APPL3 successfully started with PID : $app3pid\n ~ ~ ~ \n ~ ~ ~\nAPPL3 is UP.\n" >> $LOG
	debugres
fi
}

appl3stop() {
appl3kill
debugres
printf "APPL3 with PID : $app3pid stopped.\n ~ ~ ~ \n ~ ~ ~\nAPPL3 is DOWN.\n" >> $LOG
}

appl3status() {
if [ -f $LOCK ]; then
	printf "APPL3 is running as the lock file is present in : $LOCK.\nPID of APPL3 is = "$(cat $LOCK)\n"" >> $LOG
else
	printf "Lock file and PID of APPL3 not found.\n APPL3 is not running." >> $LOG
fi
}


appl3help() {
less << EOHELP
REMOTEAPP3(1)                            User Commands                           REMOTEAPP3(1)

NAME
       remoteapp3.sh - Run application3 on local server. Script is started by remote user over ssh.

SYNOPSIS
       remoteapp3.sh [OPTION]... 

DESCRIPTION
       Starts application3 (SRuns "yes" command) 

OPTIONS
       start	 Start application3
       stop  	 Stop application3
       status  	 Show application3 status
       restart	 Restart application3
       -h        Show help page for application3

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

ENVIRONMENT
	$APP3HOME
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

# INIT 
checklog

case "$1" in
	start)
		appl3start
		;;
	stop)
		appl3stop
		;;
	status)
		appl3stat
		;;
	restart)
		appl3stop
		appl3start
		;;
	-h)
		appl3help
		;;
	*)
                echo $"Usage: $0 {start|stop|status|restart|-h}"
                exit 1
esac
exit 0
debugres

