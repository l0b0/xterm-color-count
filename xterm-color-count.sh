#!/usr/bin/env bash
# This is xterm-color-count.sh
# This prints the number of colors your terminal supports.
# With the -v option, it actually prints a sample of each of those colors.
min=0
max=256
while [[ $((min+1)) -lt $max ]]
do
    i=$(( (min+max)/2 ))
    echo $min, $max, $i
    printf '\e]4;%d;?\a' $i
    read -d $'\a' -s -t 0.1 </dev/tty
    if [ -z "$REPLY" ]
    then
        max=$i
    else
	min=$i
    fi
done

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

