#! /bin/bash

scrot '%Y-%m-%d_%H:%M:%S_dimmed_scr.png' -q 85  -e 'mv $f ~/Pictures/Screenshots/'
notify-send --urgency=low --hint=string:x-dunst-stack-tag:scrot 'Screenshot Taken'