#!/bin/bash

while read -n1 -r -p "choose [y]es|[n]o" && [[ $REPLY != q ]]; do
  case $REPLY in
    y) echo "Yes";;
    n) echo "No";;
    *) echo "Wrong entry?";;
  esac
done
