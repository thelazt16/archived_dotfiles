#! /bin/bash

pulsemixer --id 0 --toggle-mute ; notify-send --urgency=low --hint=string:x-dunst-stack-tag:volume "$(sh ~/.scripts/detectmutepulse.sh)"