#! /bin/sh

window_id=$1
class=$2
instance=$3

#WM_WINDOW_ROLE Rules
role=$(xprop -id $1 | grep WM_WINDOW_ROLE | awk -F '"' '{print $2}')
case "$role" in
  quake) #Tilix Quake
    echo "state=floating"
    echo "border=off"
    ;;
  pop-up|bubble|task_dialog|Preferences|dialog|menu)
    echo "state=floating"
    ;;
  About|Organizer) #Firefox
    echo "state=floating"
    ;;
esac