#! /bin/bash

# vlc $(fd --search-path /mnt/libraries/Libraries/ArchDown --extension mkv --extension mp4 --extension rar | $HOME/.config/rofi/dracula/dmenu.sh)

IFS=$'\n'
files="$(fd --search-path '/run/media/dimmed/01D4747136A4BF40/Libraries/ArchDown' --extension mkv --extension mp4 --extension rar)"
filenames=()
for e in ${files[@]}; do
    filenames=("${filenames[@]}" ${e##*/}) 
done
choice=$(printf "%s\n" "${filenames[@]}" | $HOME/.config/bspwm/rofi/bin/dmenu.sh) 
choice_path=$(printf "%s\n" "${files[@]}" | grep "$choice")
# echo $choice_path
if [ "$choice_path" = "$files" ]; 
    then exit; 
    else 
    smplayer "$choice_path"; 
fi