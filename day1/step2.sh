#!/bin/bash

set -e
set -u
set -o pipefail

function getNumber() {
    line=$1
    len=${#line}

    counter=+1
    index=0
    word=""

    while [ "$index" -ne "$len" ]; do
      token=${line:index:1}

      word="${word}${token}"

      case $word in
        *one*) token=1 ;;
        *two*) token=2 ;;
        *three*) token=3 ;;
        *four*) token=4 ;;
        *five*) token=5 ;;
        *six*) token=6 ;;
        *seven*) token=7 ;;
        *eight*) token=8 ;;
        *nine*) token=9 ;;
        *) ;;
      esac

      case $token in
        ''|*[0-9]*) break ;;
      esac

      index=$((index+counter))
    done

    left=$token

    counter=-1
    index=$((len-1))
    word=""

    while [ "$index" -gt -1 ]; do
      token=${line:index:1}

      word="${token}${word}"

      case $word in
        *one*) token=1 ;;
        *two*) token=2 ;;
        *three*) token=3 ;;
        *four*) token=4 ;;
        *five*) token=5 ;;
        *six*) token=6 ;;
        *seven*) token=7 ;;
        *eight*) token=8 ;;
        *nine*) token=9 ;;
        *) ;;
      esac

      case $token in
        *[0-9]*) break ;;
      esac

      index=$((index+counter))
    done

    echo "${left}${token}"
}

sum=0
index=0
while read -r line
do
  number=$(getNumber "$line")
  sum=$((sum+number))
done < input.txt

echo "Sum: $sum"
