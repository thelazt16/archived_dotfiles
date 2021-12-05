case $(ovc) in
	"No sessions available")
		echo "Fuck"
	;; 
	*) 
		for i in $(ovc | grep .ovpn | awk -F ' ' '{print $3}') 
		sudo openvpn3 session-manage --disconnect --config $i
		echo "All sessions disconnected"
		;;
esac