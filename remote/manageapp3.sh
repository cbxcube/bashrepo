#!/bin/bash

#!/bin/bash
# put on local machine

HOST=5.135.158.225

debugres() {
# Can be called from new line after command or with "||" on one line
# Example : cmd1 || debugres
echo "~~~ DEBUG ~~~ : Exit code of operation ID $debugid = $?"
let debugid="$debugid+1"
}

startremote3() {
ssh -q $HOST /home/cubic/scripts/remoteapp3.sh start 2&1>/dev/null
debugres
}

stopremote3() {
ssh -q $HOST /home/cubic/scripts/remoteapp3.sh stop 2&1>/dev/null
debugres
}
monitremote3() {
ssh -q $HOST /home/cubic/scripts/remoteapp3.sh status 2&1>/dev/null
debugres
}

restremote3() {
ssh -q $HOST /home/cubic/scripts/remoteapp3.sh restart 2&1>/dev/null
debugres
}


# INIT
case "$1" in
	start)
		startremote3
		debugres
		;;
	stop)
		stopremote3
		debugres
		;;
	status)
		monitremote3
		debugres
		;;
	restart)
		startremote3
		debugres
		stopremote3
		debugres
		;;
	-h)
		#appl3help - >>> Function should be moved to lib/file as it is long text
		printf "USAGE: $0 [start|stop|status|restart|-h] 
		;;
	*)
                echo $"Usage: $0 {start|stop|status|restart|-h}"
                exit 1
	
