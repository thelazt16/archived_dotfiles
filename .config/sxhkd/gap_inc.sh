#! /bin/sh
declare -i gap
declare -i plus

gap=$(bspc config window_gap)
plus=$gap+5

bspc config window_gap $plus
notify-send --urgency=low --hint=string:x-dunst-stack-tag:gap "Gap Increased to "$plus
