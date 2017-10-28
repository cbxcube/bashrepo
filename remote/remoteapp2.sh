#!/bin/bash
# Run on remote machine

crlock() {
touch .app20lock > /dev/null
}

rmlock() {
rm .app20lock > /dev/null
}


app2() {
echo "App20 started......[OK]" >> app2.log
date >> app2.log
uptime >> app2.log
cat app2.log
sleep 30
}


apppid=$(ps -ef |grep remoteapp2.sh|grep -v grep |awk '{print $2}')

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
    #apppid=$(ps -ef |grep remoteapp2.sh|grep -v grep |awk '{print $2}')
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

