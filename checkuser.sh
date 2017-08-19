#!/bin/bash
echo "first argument:" "$1"
echo "second argument" "$2"

if [[ -z $1 ]]; then
  echo "Provide user to check as first argument"; exit 2
elif [[ -z $2 ]]; then
  echo "Provide server on which check user"; exit 2
else
  echo "Checking $1 on machine $2";
fi


echo "### PROGRAM RUN ### "
echo "grep $1 from /etc/passwd on $2"

greprun() {

  file="/etc/passwd"
  user="$1"
  hostname="$2"
  grepcmd="/bin/grep"
  $(sudo $grepcmd $user $file); echo ""

}
 
$(greprun)
