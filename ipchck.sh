#!/bin/bash


# veriffy format of IP address if fits to ipv4
# RegExp used 000.000.000.000 -999.999.999.999


# Check if only 1 argument was provided
if [ $# != 1 ]; then
    echo "Usage: $0 address"
    exit 1
else
	ip=$1
fi

if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo "Looks like an IPv4 IP address"
elif [[ $ip =~ ^[A-Fa-f0-9:]+$ ]]; then
    echo "Could be an IPv6 IP address"
else
    echo "String is not matching IPv4/IPv6 format!"
fi
