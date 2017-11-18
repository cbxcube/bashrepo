#!/bin/bash
# put on local machine
# This script "manageapp3.sh@loclahost" is used to triger remote script "remoteapp3.sh@kimsufi"

# VARIABLES
HOST="5.135.158.225"
HOME=$(pwd)
LOG="$HOME/appl3mng.log"
LOCK="$HOME/.appl3mng.lock"
debugid="200"
app3mngpid=""


debugres() {
# Can be called from new line after command or with "||" on one line
# Example : cmd1 || debugres
echo "~~~ DEBUG ~~~ : Exit code of operation ID $debugid = $?"
#let debugid="$debugid++1"
let debugid="$debugid+1"
}

checklog() {
if [ -f $LOG ]; then
	printf "APPL3 log file : $LOG already exists and will be appended with new entries." >> $LOG
	printf "APPL3 log file : $LOG already exists and will be appended with new entries."
	date >> $LOG
else
	touch $LOG
	printf "APPL3.log file not found in APPL3 home. Creating empty log file." >> $LOG
	printf "APPL3.log file not found in APPL3 home. Creating empty log file." 
	date >> $LOG
fi
}


startremote3() {
date >> $LOG
#ssh -q $HOST /home/cubic/scripts/remoteapp3.sh start 2&1>/dev/null >> $LOG
ssh $HOST /home/cubic/scripts/remoteapp3.sh start
#app3mngpid=$!
debugres
#echo $app3mngpid > $LOCK
printf "\nRemote APPL3@kimsufi is ONLINE.\n" >> $LOG
printf "\nLock file : $LOCK created\n" >> $LOG 
printf "\nRemote APPL3@kimsufi is ONLINE.\n"
printf "\nLock file : $LOCK created\n"
exit 0
}

stopremote3() {
date >> $LOG
#ssh -q $HOST /home/cubic/scripts/remoteapp3.sh stop 2&1>/dev/null >> $LOG
ssh $HOST /home/cubic/scripts/remoteapp3.sh stop >> $LOG
debugres
yes | rm $LOCK >> $LOG
debugres
printf "\nRemote APPL3@kimsufi is OFFLINE\n" >> $LOG 2>&1
printf "\nLock file : $LOCK removed\n" >> $LOG 2>&1
exit 0
}

monitremote3() {
ssh -q $HOST /home/cubic/scripts/remoteapp3.sh status 2&1>/dev/null
if [ $? = 301 ]; then
	printf "\nExit code 301 - APPL3@kimsufi is ONLINE\n"
else
	printf "\nRemote APPL3@kimsufi is OFFLINE\n"
	printf "\nLock file : $LOCK removed\n"
fi
debugres
}

restremote3() {
ssh -q $HOST /home/cubic/scripts/remoteapp3.sh restart 2&1>/dev/null >> $LOG
debugres
date >> $LOG
printf "\nStopping emote APPL3@kimsufi\n">> $LOG
stopremote3
debugres
printf "\nAPPL3@kimsufi is STOPPED">> $LOG
printf "\nStarting emote APPL3@kimsufi\n">> $LOG
startremote3
debugres
printf "\nAPPL3@kimsufi was RESTARTED SUCCESSFULLY. New PID : $app3mngpid\n">> $LOG
}


# INIT
checklog
#debugres

case "$1" in
	start)
		startremote3
		;;
	stop)
		stopremote3
		;;
	status)
		monitremote3
		;;
	restart)
		startremote3
		stopremote3
		;;
	-h)
		#appl3help - >>> Function should be moved to lib/file as it is long text
		printf "USAGE: $0 [start|stop|status|restart|-h]\nExiting.\n"
		;;
	*)
                echo $"Usage: $0 {start|stop|status|restart|-h}"
                exit 1
esac
exit 0
