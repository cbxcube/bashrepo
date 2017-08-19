#!/bin/bash

HOSTNAME=`hostname`
DOMAINNAME=`domainname`
TOOL=`/usr/bin/apt-cache`
TOOL_PARAM="pkgnames glibc"
USER=`echo $USER`

if [[ $HOSTNAME == ip* ]]

then
	echo "Please set the hostname before checking glibc"
	exit 1
fi

#if [[ $DOMAINNAME != "floex.com" ]]

#then
#	echo "Domain name should be set to floex.com."
#	exit 1
#	exit 0
#fi

if [[ ! -x "$TOOL" ]]

then

	echo "apt-cache is not in expected location... exiting"
	exit 1

else 
	echo "apt-cache found ... continuing"


### OK basic sanity tests passed - continue by checking the package version 
