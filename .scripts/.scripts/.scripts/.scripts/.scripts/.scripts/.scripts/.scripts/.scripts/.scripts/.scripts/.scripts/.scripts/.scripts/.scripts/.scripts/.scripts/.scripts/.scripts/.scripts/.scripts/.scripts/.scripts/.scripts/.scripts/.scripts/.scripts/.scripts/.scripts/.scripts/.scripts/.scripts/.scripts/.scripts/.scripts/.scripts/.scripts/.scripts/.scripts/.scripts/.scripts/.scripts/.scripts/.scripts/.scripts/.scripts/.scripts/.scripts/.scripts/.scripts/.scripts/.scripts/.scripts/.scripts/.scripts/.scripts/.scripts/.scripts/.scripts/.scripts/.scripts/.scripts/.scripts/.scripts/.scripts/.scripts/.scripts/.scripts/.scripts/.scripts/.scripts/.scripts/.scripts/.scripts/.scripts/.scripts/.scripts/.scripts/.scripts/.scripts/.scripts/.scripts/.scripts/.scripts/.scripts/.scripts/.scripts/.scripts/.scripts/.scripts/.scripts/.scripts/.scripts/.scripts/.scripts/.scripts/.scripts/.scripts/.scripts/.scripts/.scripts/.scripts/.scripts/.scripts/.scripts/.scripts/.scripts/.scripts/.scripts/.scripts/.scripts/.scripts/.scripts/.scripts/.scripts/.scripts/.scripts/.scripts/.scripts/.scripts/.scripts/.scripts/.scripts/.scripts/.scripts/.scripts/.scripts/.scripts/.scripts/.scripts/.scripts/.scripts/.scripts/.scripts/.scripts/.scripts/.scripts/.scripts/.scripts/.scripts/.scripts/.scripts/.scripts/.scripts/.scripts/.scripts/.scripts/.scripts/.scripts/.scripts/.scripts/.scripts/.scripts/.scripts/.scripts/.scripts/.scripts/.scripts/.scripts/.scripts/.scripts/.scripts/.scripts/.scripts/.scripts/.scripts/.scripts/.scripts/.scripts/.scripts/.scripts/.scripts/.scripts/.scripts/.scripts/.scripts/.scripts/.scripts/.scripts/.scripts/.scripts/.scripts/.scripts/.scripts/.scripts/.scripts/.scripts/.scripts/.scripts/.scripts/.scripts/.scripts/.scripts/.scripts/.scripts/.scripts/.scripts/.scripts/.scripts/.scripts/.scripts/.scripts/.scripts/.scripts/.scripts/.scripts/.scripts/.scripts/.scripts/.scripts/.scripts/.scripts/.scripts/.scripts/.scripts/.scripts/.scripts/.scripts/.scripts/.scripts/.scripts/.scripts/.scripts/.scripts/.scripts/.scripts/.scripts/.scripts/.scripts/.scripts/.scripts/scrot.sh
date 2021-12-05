#! /bin/bash

scrot $HOME/Pictures/Screenshots/'%m-%d-%Y_%H-%M-%S_dimmed.png' -q 100 -e 'xclip -selection clipboard -target image/png -i $f'
# scrot '%m-%d-%Y_%H-%M-%S_dimmed.png' -q 100  -e 'mv $f ~/Pictures/Screenshots/'
notify-send --urgency=low --hint=string:x-dunst-stack-tag:scrot 'Screenshot Taken'