#! /bin/bash

#################################################
#####		Febri Eka Setyawan				#####
#####	    thelazt16@gmail.com				#####
#####https://github.com/thelazt16/dotfiles	#####
#################################################

main () {
	xdotool key grave
	#Open Tilix
	tilix
	sleep 0.3

	#Open Sublime Text
	sleep 0.3
	xdotool key Super_L+d
	sleep 0.3
	xdotool type "Sublime Text"
	sleep 0.3 
	xdotool key Return
	sleep 0.3

	#Open Unimatrix
	tilix
	sleep 0.3
	xdotool type "unimatrix"
	sleep 0.3
	xdotool key Return
	sleep 0.3
	xdotool key 3

	#Move to Left Node
	xdotool key Super_L+Left
	sleep 0.3

	#Type Unixporn with Figlet
	tilix
	sleep 0.3
	xdotool key ctrl+l
	sleep 0.3
	xdotool type "figlet r/unixporn"
	sleep 0.3
	xdotool key Return

	#Increase Gaps
	for (( i = 0; i < 9; i++ )); do
		xdotool key Super_L+shift+equal
		sleep 0.01
	done

	#Increase Border
	for (( i = 0; i < 3; i++ )); do
		xdotool key Super_L+shift+ctrl+equal
		sleep 0.01
	done

	#Modify unixporn
	xdotool key Super_L+shift+t
	sleep 0.3
	for (( i = 0; i < 18; i++ )); do
		xdotool key Super_L+shift+alt+Left
		sleep 0.01
	done
	for (( i = 0; i < 16; i++ )); do
		xdotool key Super_L+shift+alt+Up
		sleep 0.01
	done

	#Modify ufetch
	xdotool key Super_L+Up
	sleep 0.3
	xdotool key Super_L+shift+t
	sleep 0.3
	for (( i = 0; i < 15; i++ )); do
		xdotool key Super_L+shift+alt+Left
		sleep 0.01
	done
	for (( i = 0; i < 13; i++ )); do
		xdotool key Super_L+shift+alt+Up
		sleep 0.01
	done

	#Modify Sublime Text
	xdotool key Super_L+Right
	sleep 0.3
	for (( i = 0; i < 12; i++ )); do
		xdotool key Super_L+alt+Down
		sleep 0.01
	done

	#Modify unimatrix
	xdotool key Super_L+Down
	sleep 0.3
	xdotool key Super_L+shift+t
	sleep 0.3
	for (( i = 0; i < 5; i++ )); do
		xdotool key Super_L+shift+alt+Left
		sleep 0.01
	done

	sleep 0.7
}

close () {
	#Decrease Gaps
	for (( i = 0; i < 9; i++ )); do
		xdotool key Super_L+shift+minus
		sleep 0.01
	done

	#Decrease Border
	for (( i = 0; i < 3; i++ )); do
		xdotool key Super_L+shift+ctrl+minus
		sleep 0.01
	done

	#Close
	sleep 0.3
	xdotool key Super_L+Left
	sleep 0.3
	xdotool key Super_L+Up
	sleep 0.3
	xdotool key Super_L+q
	sleep 0.3
	xdotool key Super_L+q
	sleep 0.3
	xdotool key Super_L+Right
	sleep 0.3
	xdotool key Super_L+t

}

main2 () {

	#Monocle Thing
	sleep 0.5
	xdotool key Super_L+m
	sleep 0.7
	xdotool key Super_L+m
	sleep 0.5
	xdotool key Super_L+m
	sleep 0.7
	xdotool key Super_L+grave
	sleep 0.5
	xdotool key Super_L+grave
	sleep 0.5
	xdotool key Super_L+grave
	sleep 0.5
	xdotool key Super_L+grave

	#Increase Gaps
	for (( i = 0; i < 25; i++ )); do
		xdotool key Super_L+shift+equal
		sleep 0.01
	done

	#Increase Border
	for (( i = 0; i < 25; i++ )); do
		xdotool key Super_L+shift+ctrl+equal
		sleep 0.01
	done

	sleep 0.5
	xdotool key Super_L+m
	sleep 0.7
	xdotool key Super_L+m

	sleep 0.5 

	#Quake Things
	xdotool key grave
	sleep 0.3
	tilix -a session-add-down
	sleep 0.3
	xdotool type "bspc config gapless_monocle true"
	sleep 0.5
	xdotool key Return
	sleep 0.3
	xdotool type "bspc config gapless_monocle false"
	sleep 0.5
	xdotool key Return
	sleep 0.3
	xdotool type "bspc config borderless_monocle true"
	sleep 0.5
	xdotool key Return
	sleep 0.3
	xdotool type "bspc config borderless_monocle false"
	sleep 0.5
	xdotool key Return
	sleep 0.5
	xdotool key ctrl+shift+x
	sleep 0.5
	xdotool key grave


	#Decrease Gaps
	for (( i = 0; i < 25; i++ )); do
		xdotool key Super_L+shift+minus
		sleep 0.01
	done

	#Decrease Border
	for (( i = 0; i < 25; i++ )); do
		xdotool key Super_L+shift+ctrl+minus
		sleep 0.01
	done
	
	sleep 0.3
	xdotool key Super_L+m
	sleep 0.3
	xdotool key Super_L+q
	sleep 0.3
	xdotool key Return
	sleep 0.3
	xdotool key Super_L+ctrl+3
	sleep 0.3
	tilix
	sleep 0.3
	xdotool key Super_L+ctrl+1
	sleep 0.15
	xdotool key Super_L+ctrl+2
	sleep 0.15
	xdotool key Super_L+ctrl+3
	sleep 0.15
	xdotool key Super_L+ctrl+3
	sleep 0.15
	xdotool key Super_L+ctrl+4
	sleep 0.15
	xdotool key Super_L+ctrl+5
	sleep 0.15
	xdotool key Super_L+ctrl+6
	sleep 0.15
	xdotool key Super_L+ctrl+7
	sleep 0.3
	tilix
	sleep 0.3
	xdotool key Super_L+Left
	sleep 0.15
	xdotool key Super_L+ctrl+Right
	sleep 0.15
	xdotool key Super_L+ctrl+Down
	sleep 0.15
	xdotool key Super_L+ctrl+Left
	sleep 0.15
	xdotool key Super_L+ctrl+Up
	sleep 0.3
	tilix
	sleep 0.3
	xdotool key Super_L+Down
	sleep 0.3
	xdotool key Super_L+Left
	sleep 0.3
	xdotool key Super_L+Right
	sleep 0.3
	xdotool key Super_L+Up
	sleep 0.3
	xdotool key Super_L+Left
	sleep 0.15
	xdotool key Super_L+Right
	sleep 0.15
	xdotool key Super_L+Down
	sleep 0.15
	xdotool key Super_L+Left
	sleep 0.15
	xdotool key Super_L+Right
	sleep 0.15
	xdotool key Super_L+Up
	sleep 0.15
	tilix
	sleep 0.3
	xdotool key Super_L+Left
	sleep 0.3
	xdotool key Super_L+q
	sleep 0.3
	xdotool key Super_L+q
	sleep 0.3
	xdotool key Super_L+q
	sleep 0.3
	xdotool key Super_L+q
	sleep 0.3
	xdotool key Super_L+q

}

main
close
main2

