#! /bin/sh
declare -i gap
declare -i minus

gap=$(bspc config window_gap)
minus=$gap-5

bspc config window_gap $minus
notify-send --urgency=low --hint=string:x-dunst-stack-tag:gap "Gap Decreased to "$minus
