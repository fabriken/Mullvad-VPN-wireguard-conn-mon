#!/bin/bash +x
# WireGuard connection monitor & MAC randomiser
# Written by Mikael Oerberg

# Define connection to monitor in $DEV and define IP to check if it's up.
# Change $TIME to however frequent you would like to check if the connection is up. (polling rate of the script in seconds)

TIME=3
DEV=eth0
IP=192.168.0.135
DIR=/etc/wireguard
while true
do
		WIRE=$(wg |grep -c interface)
	if (( $WIRE < 1 )); then
		#VPN=$(ls $DIR | shuf -n 1) 			# Uncomment to connect to random servers.
		VPN=$(ls $DIR/mullvad-se* | shuf -n 1)		# Or define country here.
		echo "Connecting to $VPN... - $(date)"
		wg-quick up $VPN
		sleep 3
else
		CONS=$(wg |grep -c interface)
	if (( $CONS > 1 )); then
		MULTI=$(wg | grep interface | sed '1d' | awk '{print $2};')
		echo 'Too many connections!'
		wg-quick down $DIR/$MULTI.conf
else
		sleep 3
		PING=$(ping -w 3 193.138.218.74 | grep -c '0 received')
	if (( $PING !=1 )); then
		CUR=$(wg | grep interface | awk '{print $2};')
		echo "Connected to: "$CUR""
		macchanger -s $DEV
		sleep $TIME
else
		echo 'VPN DNS Unavailable!'
		CURR=$(wg | grep interface | awk '{print $2};')
		wg-quick down $DIR/$CURR.conf
        sleep 3
    	fi
	fi
	fi
done
