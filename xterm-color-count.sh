#!/usr/bin/env bash
i=0
while true
do
    printf '\e]4;%d;?\a' $i
    read -d $'\a' -s -t 1 </dev/tty
    if [ -z "$REPLY" ]
    then
        echo $i
        exit
    fi
    let i+=1
done
