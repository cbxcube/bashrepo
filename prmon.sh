#!/bin/bash
##
## check if process is running : 
## 	- local, remote, user exist, logging,...
#
## Something like this : 
#ServerRoot "/var/www"
#
#Mutex file:${APACHE_LOCK_DIR} default
#
#PidFile ${APACHE_PID_FILE}
#
#Timeout 300
#
#KeepAlive On
#
#MaxKeepAliveRequests 100
#
#KeepAliveTimeout 5
#
#
#User ${APACHE_RUN_USER}
#Group ${APACHE_RUN_GROUP}
#
#HostnameLookups On
#
#ErrorLog ${APACHE_LOG_DIR}/error.log
#
#LogLevel warn
#
