#! /bin/sh
#Just tad simple nordvpn status checker.
#Using nmcli because it faster than "nordvpn status"
#Check you tunx with nmcli when you're connected with nordvpn
#change 0 in awk -F '0' to your tun number

status=$(nmcli c | grep tun0 | awk -F '0' '{print $1}')

if [[ "$status" = "tun" ]]; then
	echo "%{F#00ffab}"
else
	echo "%{F#ff00a8}"
fi