#!/bin/bash

sum=0
while read -r line
do
  len=${#line}
  index=0
  while [ $index -ne "$len" ]; do
    first=${line:index:1}
    case $first in
      ''|*[0-9]*) break ;;
      *) ;;
    esac
    index=$((index+1))
  done

  index=$((len-1))
  while [ "$index" -ne -1 ]; do
    last=${line:index:1}
    case $last in
      ''|*[0-9]*) break ;;
      *) ;;
    esac
    index=$((index-1))
  done

  sum=$((sum+${first}${last}))
done < input.txt

echo "Sum: $sum"