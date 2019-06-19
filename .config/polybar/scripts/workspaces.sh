#!/bin/zsh
counter=0
bspc query -D --names | while read -r name; do
  printf 'ws-icon-%i = "%s;<insert-icon-here>"\n' $((counter++)) $name
done