#! /bin/bash

value=$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $4 }')
volume=$(amixer sget Master | grep 'Right:' | awk -F'[][]' '{ print $2 }')

if  [[ $value = 'on' ]]; then
	echo 'Unmuted'
elif [[ $value = 'off' ]];  then
    echo 'Muted'
else
	echo 'Unknown'
fi
