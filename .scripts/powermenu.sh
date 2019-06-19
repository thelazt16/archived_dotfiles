#! /bin/bash

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -width 30 -hide-scrollbar -line-padding 4 -padding 25 -lines 1 -columns 4 <<< " Lock| Logout| Reboot| Shutdown")"
            case "$MENU" in
                *Lock) betterlockscreen -l ;;
                *Logout) bspwm quit;;
                *Reboot) systemctl reboot ;;
                *Shutdown) systemctl -i poweroff
            esac
