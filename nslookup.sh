#!/bin/sh

# use : ./nslookup.sh < list.txt

echo ------------------------------------------------------------------------------------------
printf "| %-35s | %-15s | %-30s |\n" Host 'IP Address' 'CNAME FQDN'
echo ------------------------------------------------------------------------------------------
while read host junk; do
    [ -z "$host" ] && continue
    echo $host | grep -q ^# && continue

    NSQ=$(nslookup $host 2>&1)
    echo "$NSQ" | grep -q -F "can't find" && {
        ADDR='N/A'
        FQDN='N/A'
    } || {
        ADDR=$(echo "$NSQ" | awk '/^Address:/{print $2}')
        FQDN=$(echo "$NSQ" | awk '/^Name:/{print $2}')
    }

    printf "| %-35s | %15s | %-30s |\n" $host $ADDR $FQDN
done
echo ------------------------------------------------------------------------------------------


