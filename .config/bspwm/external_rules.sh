#! /bin/sh

window_id=$1
class=$2
instance=$3

#Class
#notify-send 'Class:'"$class"
if [[ $class == "Tilix" ]]; then
  role=$(xprop -id $1 | grep WM_WINDOW_ROLE | awk -F '"' '{print $2}')
  case $role in
    quake) #Tilix Quake
      echo "state=floating"
      echo "border=off"
      ;;
  esac
elif [[ $class == "Firefox" ]]; then
  echo "split_ratio=0.35"
  role=$(xprop -id $1 | grep WM_WINDOW_ROLE | awk -F '"' '{print $2}')
  case $role in
    About|Organizer) #Firefox About and Organizer(i.e. Downloads, Bookmarks)
      echo "state=floating"
      ;;
  esac
elif [[ $class == "smplayer" ]]; then
  title=$(xprop -id $1 | grep WM_NAME | awk -F '"' '{print $2}')
  case $title in
    *playlist) # SMPlayer playlist
      echo "state=tiled"
      echo "split_ratio=0.82"
      ;;
  esac
fi