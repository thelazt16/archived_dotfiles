#! /bin/bash

MENU="$(rofi -sep "|" -dmenu -i -p '' -width 20 -hide-scrollbar -line-padding 0 -padding 0 -lines 2 -columns 2 <<< " Lock| Logout| Reboot| Shutdown")"
            case "$MENU" in
                *Lock) betterlockscreen -s ;;
                *Logout) bspc quit;;
                *Reboot) systemctl reboot ;;
                *Shutdown) systemctl -i poweroff
            esac
