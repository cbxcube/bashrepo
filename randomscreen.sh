#!/bin/bash
#
# 1/aug/2016 - working - ok

genstring() {
  
  (</dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB'|head -c 60); echo ""

}



#genstring




sleept=0.2

if [[ -n $1 ]]; then
   startt=$1
else
   startt="1"
fi

if [[ -n $2 ]]; then
   repeatt=$2
else
   repeatt="100"
fi


while [[ $startt -le $repeatt ]]; do
   echo "$startt" && sleep "$sleept" && genstring
   ((startt = startt +1))
done


#printlines() {
#
#  genstring=$(</dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB'|head -c 60)
#  repeat=$2
#  start=$1
#  sleept=0.2
#  while [[ $start -le $repeat ]]; do 
#     echo "$start\n" && sleep $sleept && echo $genstring
#     ((start = start +1))
#  done
#
#}

