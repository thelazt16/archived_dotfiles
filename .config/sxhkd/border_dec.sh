#! /bin/sh
declare -i border
declare -i minus

border=$(bspc config border_width)
minus=$border-1

bspc config border_width $minus
notify-send --urgency=low --hint=string:x-dunst-stack-tag:border "Border Decreased to "$minus
