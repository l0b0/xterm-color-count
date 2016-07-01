#!/usr/bin/env bash

# First, test if terminal supports OSC 4 at all.
printf '\e]4;%d;?\a' 0
read -d $'\a' -s -t 0.1 </dev/tty
if [ -z "$REPLY" ]
then
    # OSC 4 not supported, so we'll fall back to terminfo 
    tput colors
    exit 0
fi

# Binary search 
min=0
max=256
while [[ $((min+1)) -lt $max ]]
do
    i=$(( (min+max)/2 ))
    printf '\e]4;%d;?\a' $i
    read -d $'\a' -s -t 0.1 </dev/tty
    if [ -z "$REPLY" ]
    then
        max=$i
    else
	min=$i
    fi
done

# If -v is given, show all the colors
if [ "${1-}" = -v ]
then
    for ((i=0; i<max; i++))
    do
	printf '\e[%dm' $i
	printf $i
	tput sgr0
	printf '\n'
    done
else
    echo "$max"
fi
