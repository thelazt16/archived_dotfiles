#! /bin/bash

pulsemixer --id 0 --change-volume +10 --unmute
notify-send --urgency=low --hint=string:x-dunst-stack-tag:volume "Volume Up : $(pulsemixer --id 0 --get-volume | grep '' | awk -F' ' '{print $2}')"