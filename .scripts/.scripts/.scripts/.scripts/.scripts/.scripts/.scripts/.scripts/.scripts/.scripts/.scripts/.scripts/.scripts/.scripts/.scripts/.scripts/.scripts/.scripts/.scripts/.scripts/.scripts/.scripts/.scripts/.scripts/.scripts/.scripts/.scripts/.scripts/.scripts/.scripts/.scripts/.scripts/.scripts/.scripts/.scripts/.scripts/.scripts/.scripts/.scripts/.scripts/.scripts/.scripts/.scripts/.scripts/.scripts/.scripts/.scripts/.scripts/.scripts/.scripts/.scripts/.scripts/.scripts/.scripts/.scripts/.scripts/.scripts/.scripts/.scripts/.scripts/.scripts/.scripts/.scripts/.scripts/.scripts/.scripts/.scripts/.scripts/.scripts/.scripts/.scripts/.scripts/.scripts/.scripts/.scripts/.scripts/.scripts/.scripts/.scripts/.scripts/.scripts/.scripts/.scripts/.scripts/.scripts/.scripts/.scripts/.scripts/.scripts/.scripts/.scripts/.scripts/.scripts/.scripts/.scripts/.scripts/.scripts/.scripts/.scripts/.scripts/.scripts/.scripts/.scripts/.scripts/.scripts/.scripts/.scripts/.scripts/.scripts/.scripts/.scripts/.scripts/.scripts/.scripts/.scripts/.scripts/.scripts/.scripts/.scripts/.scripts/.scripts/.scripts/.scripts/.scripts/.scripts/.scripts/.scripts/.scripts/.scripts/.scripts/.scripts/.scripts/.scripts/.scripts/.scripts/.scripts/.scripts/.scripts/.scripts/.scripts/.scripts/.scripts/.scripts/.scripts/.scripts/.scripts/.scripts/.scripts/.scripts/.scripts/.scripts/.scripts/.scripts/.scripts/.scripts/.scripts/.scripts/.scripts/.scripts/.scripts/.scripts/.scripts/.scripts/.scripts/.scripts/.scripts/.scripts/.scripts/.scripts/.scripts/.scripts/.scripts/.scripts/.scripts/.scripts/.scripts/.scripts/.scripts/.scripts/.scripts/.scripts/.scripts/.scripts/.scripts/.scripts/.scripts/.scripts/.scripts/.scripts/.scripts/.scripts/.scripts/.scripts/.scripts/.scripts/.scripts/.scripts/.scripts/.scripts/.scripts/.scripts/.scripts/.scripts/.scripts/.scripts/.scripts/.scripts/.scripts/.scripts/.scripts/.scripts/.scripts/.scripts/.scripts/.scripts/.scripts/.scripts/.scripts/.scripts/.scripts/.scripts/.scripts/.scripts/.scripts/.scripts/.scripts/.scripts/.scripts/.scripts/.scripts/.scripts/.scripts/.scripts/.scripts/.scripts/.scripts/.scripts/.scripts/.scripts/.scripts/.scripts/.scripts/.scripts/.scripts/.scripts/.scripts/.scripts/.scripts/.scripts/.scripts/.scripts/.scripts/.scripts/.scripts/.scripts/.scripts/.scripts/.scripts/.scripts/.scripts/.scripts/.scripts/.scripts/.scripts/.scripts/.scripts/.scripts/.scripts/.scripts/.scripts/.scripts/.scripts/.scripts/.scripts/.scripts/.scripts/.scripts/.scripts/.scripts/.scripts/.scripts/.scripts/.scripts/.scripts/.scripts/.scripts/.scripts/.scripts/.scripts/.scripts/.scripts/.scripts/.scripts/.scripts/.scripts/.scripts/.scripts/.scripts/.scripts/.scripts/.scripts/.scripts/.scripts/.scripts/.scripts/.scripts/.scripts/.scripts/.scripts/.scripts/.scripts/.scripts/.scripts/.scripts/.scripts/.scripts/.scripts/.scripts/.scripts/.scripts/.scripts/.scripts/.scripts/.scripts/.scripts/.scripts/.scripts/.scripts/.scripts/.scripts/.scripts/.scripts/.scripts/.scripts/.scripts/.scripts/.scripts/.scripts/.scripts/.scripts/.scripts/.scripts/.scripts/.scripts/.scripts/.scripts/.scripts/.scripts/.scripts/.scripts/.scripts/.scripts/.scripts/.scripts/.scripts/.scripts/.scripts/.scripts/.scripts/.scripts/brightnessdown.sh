#! /bin/bash

xbacklight -5 && notify-send --urgency=low --hint=string:x-dunst-stack-tag:brightness "Brightness Down : $(echo "$(xbacklight -get)/1" | bc)"