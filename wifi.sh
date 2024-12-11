#!/bin/bash 


function create_config_file {
	# $1 essid $2 password
	wpa_passphrase $1 $2 > wpa.conf
}

function connect {
	# $1 interface $2 config file path
	wpa_supplicant -B -i $1 -c $2
	dhclient $1
}

optstring="hcxe:p:i:f:"

while getopts $optstring opt; do

	case $opt in 
		h) echo "Usage: -h help -c create file -x connect to network -e essid -p password -i interface -f filepath" ;;
		c) create_config_file $essid $password ;;
		x) connect $interface $filepath ;;
		e) essid=$OPTARG ;;
		p) password=$OPTARG ;;
		i) interface=$OPTARG ;;
		f) filepath=$OPTARG ;;
		
	esac
	
done 
