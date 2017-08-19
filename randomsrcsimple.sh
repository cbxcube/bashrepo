#!/bin/bash

#if [[ -n $1 ]]
if [[ $1 != 0 ]]
then

  if [[ $1 -eq '--help' ]] || [[ $1 -eq '-h' ]]
  then 
     echo "Run with arguments..."
     echo ""
     echo "usage: randomscr.sh <start> <repeat>"
     echo "start = start sequence at number"
     echo "repeat = repeat number of time"
     echo ""
     echo "Example: randomscr.sh 1 100"
     exit 2
#  else [[ -z $1 ]]
  else [[ -n $1 ]]
     echo "No argument provided for <start>. Using default=1. Continue..."
     startt="1"
  fi
fi

#if [[ -z $2 ]]
if [[ $2 != 0 ]]
then
   
  if [[ -n $2 ]]
  then
     echo "No argument provided for <repeat>.Using default=100. Continue..."
     repeatt="100"
  else [[ -n $3 ]]
     echo "Too many arguments. Exiting"
     exit 2
  fi
fi

#if [[ -z $2 ]]
#then
#  startt=$2
#elif [[ -z $3 ]]
#then
#  repeatt=$3
#else [[ -z $4 ]]
#  echo "too many arguments"
#  exit 2
#fi     

printlines() {

  genstring=$(</dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB'|head -c 60)
  repeat=$2
  start=$1
  sleept=0.2
  while [[ $start -le $repeat ]]; do 
     echo "$start\n" && sleep $sleept && echo $genstring
     ((start = start +1))
  done

}

printlines
