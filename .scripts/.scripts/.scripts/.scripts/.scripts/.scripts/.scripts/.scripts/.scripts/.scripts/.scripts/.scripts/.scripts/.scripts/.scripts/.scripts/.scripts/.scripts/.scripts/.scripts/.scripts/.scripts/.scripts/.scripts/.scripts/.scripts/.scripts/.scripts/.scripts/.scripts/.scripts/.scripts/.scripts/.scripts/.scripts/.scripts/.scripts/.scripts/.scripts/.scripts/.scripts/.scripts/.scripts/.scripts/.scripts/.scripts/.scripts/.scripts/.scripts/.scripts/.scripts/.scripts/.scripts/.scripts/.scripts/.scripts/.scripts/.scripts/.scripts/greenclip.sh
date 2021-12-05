#! /bin/bash

# Capture the current clipboard
BEFORE="$( xclip -o -selection clipboard )"

rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}'
sleep 0.2

# Capture the selection
TEXT="$( xclip -o -selection clipboard )"

# Only attempt to paste if there has been selection
if [ "${TEXT}" != "${BEFORE}" ]; then
  xdotool type "$TEXT"
fi