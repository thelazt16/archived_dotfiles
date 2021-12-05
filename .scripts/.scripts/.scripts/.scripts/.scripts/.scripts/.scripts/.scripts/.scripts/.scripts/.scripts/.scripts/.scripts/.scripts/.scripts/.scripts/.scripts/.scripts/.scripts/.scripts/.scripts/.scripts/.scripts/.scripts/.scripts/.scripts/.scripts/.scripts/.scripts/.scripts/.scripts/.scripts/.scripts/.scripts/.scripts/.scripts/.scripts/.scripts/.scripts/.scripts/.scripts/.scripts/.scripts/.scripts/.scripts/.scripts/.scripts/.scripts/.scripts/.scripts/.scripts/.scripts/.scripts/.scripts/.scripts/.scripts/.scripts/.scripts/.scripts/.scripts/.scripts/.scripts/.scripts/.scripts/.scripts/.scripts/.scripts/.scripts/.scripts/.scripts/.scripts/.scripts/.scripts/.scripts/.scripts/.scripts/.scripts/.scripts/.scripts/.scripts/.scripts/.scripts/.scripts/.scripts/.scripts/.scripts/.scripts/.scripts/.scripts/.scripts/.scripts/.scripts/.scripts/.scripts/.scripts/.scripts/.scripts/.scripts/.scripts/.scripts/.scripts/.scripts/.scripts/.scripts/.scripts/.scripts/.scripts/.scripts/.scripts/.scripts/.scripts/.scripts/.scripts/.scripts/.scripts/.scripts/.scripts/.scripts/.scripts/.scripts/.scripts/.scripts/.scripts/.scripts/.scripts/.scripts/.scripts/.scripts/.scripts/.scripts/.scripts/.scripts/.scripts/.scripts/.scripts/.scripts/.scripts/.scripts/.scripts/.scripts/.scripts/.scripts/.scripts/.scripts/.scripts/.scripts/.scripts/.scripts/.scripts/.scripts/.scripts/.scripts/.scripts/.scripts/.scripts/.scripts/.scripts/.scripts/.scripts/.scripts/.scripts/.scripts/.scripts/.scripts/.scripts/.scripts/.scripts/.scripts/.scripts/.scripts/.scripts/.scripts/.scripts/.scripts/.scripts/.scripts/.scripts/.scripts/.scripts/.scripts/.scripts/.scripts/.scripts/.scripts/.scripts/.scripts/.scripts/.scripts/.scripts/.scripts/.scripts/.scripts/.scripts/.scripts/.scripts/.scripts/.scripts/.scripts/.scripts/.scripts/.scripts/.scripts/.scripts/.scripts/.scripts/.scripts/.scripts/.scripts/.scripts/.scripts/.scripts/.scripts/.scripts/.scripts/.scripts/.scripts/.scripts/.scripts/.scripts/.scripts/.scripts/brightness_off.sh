#! /bin/bash

current=$(light)
if (( $(bc <<< "$current > 5") )); then
  echo $(light) > $HOME/.scripts/last_brightness.txt
  light -S 0
else 
  light -S $(cat $HOME/.scripts/last_brightness.txt)
fi