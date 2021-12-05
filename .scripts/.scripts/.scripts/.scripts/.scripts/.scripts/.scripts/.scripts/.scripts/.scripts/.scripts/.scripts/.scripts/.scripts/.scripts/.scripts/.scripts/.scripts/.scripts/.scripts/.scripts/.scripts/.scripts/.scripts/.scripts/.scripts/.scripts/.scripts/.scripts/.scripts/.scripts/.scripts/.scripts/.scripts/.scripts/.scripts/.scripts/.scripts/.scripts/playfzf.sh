#! /bin/bash

smplayer "$(fd --search-path /mnt/libraries/Libraries/ArchDown --extension mkv --extension mp4 --extension rar | fzf --with-nth='-1' -d/)"
