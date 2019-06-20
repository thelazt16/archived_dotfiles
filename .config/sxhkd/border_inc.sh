#! /bin/sh
declare -i border
declare -i plus

border=$(bspc config border_width)
plus=$border+1

bspc config border_width $plus
notify-send --urgency=low --hint=string:x-dunst-stack-tag:border "Border Increased to "$plus
