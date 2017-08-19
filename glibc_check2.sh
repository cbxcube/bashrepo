#!/bin/bash

myhostname=$(hostname)
mykernel=$(uname -r)
myosversion=$(head -1 /etc/os-release)
myopensslversion=$(apt --installed list |grep openssl)
date=$(date)

echo "Date of check : "
echo "$date"
echo ""
echo "Hostname of checked system : "
echo ""
echo "$myhostname"
echo ""
echo "Kernel version : "
echo "$mykernel"
echo ""
echo "Os version :"
echo "$myosversion"
echo ""
echo "Open SSL packages :" 
echo "" 
echo "$myopensslversion"


