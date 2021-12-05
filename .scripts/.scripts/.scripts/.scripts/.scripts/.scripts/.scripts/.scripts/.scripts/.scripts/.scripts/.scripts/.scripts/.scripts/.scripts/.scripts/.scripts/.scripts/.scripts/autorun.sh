#!/usr/bin/env bash

pgrep -x picom > /dev/null || picom &
# pgrep -x greenclip > /dev/null || greenclip
pgrep -x redshift-gtk > /dev/null || redshift-gtk &
pgrep -x xsetroot > /dev/null || xsetroot -cursor_name left_ptr &
pgrep -x nitrogen > /dev/null || nitrogen --restore &
pgrep -x nm-applet > /dev/null || nm-applet &
pgrep -x xfce-polkit > /dev/null || /usr/lib/xfce-polkit/xfce-polkit &
pgrep -x volumeicon > /dev/null || volumeicon
