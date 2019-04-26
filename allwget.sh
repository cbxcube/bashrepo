#!/bin/bash
#
# This is used to download all scripts from particular folder on RHEL server.
# Prerequisite : RHEL server need to start python httpd daemon ( cd /$PWD && "python -m SimpleHTTPServer" )


#for i in echo $(curl -s http://lctcst4801:8000/|grep -o '".*"' |grep -v W3C |grep ^\" | cut -d '"' -f2); do wget http://lctcst4801:8000/$i; done

HOST=$1
PORT=":8000"
PREFIX="http://"

makeurl() {
printf -v $PREFIX $HOST $PORT
}

getfiles() {
curl -s makeurl|grep -o '".*"' |grep -v W3C |grep ^\" | cut -d '"' -f2
}

makeurl
getfiles

echo getfiles
