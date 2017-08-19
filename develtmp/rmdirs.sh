#!/bin/sh
die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided"
echo $1 | grep -E -q '^[0-9]+$' || die "Numeric argument required, $1 provided"

while read dir 
do
    [ -d "$dir" ] || die "Directory $dir does not exist"
    rm -rf "$dir"
done <<EOF
~/myfolder1/$1/anotherfolder 
~/myfolder2/$1/yetanotherfolder 
~/myfolder3/$1/thisisafolder
EOF
