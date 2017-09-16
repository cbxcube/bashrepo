#!/bin/sh

nice find / -type f -name 'struts2-rest*.jar' 2>/dev/null | egrep '.*' 2>/dev/null
exit_code=$?

if [ $exit_code -eq 0 ];
then
   echo "Struts rest plugin found."
   exit 1
else
   echo "Struts rest plugin not found."
   exit 0
fi


