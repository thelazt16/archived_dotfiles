#! /bin/bash

pulsemixer --change-volume -10 --unmute && notify-send --urgency=low --hint=string:x-dunst-stack-tag:volume "Volume Up : $(pulsemixer --get-volume | grep '' | awk -F' ' '{print $2}')"