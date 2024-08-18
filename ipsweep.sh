#!/bin/bash
#This project will be improved into more options. More to come.
set -e

line="======================================================="

echo "$line"
echo "       Welcome to IP Scanner - by Igor Oliveira       "
echo -e "$line\n"

echo "============== [INSTRUCTIONS] =============="
echo "Add you network address only, which is the"
echo "first 3 octets without the last period."
echo "For Example: 192.168.1"
echo -n "Press [Y] to start or [N] to give up: "
read response

if [ "$response" == "y" ] || [ "$response" == "Y" ]; then
	echo -n -e "\nType your network address as instructed above: "
	read net_ip

	if [ "$net_ip" == "" ]; then
		echo -e "\n[ERROR] You forgot to type the first 3 octets of the subnet you want to sweep."
		echo "[ATTENTION] See instructions above. and enter ./ipsweep.sh again."
	else
		echo ""
		echo "IP addresses found:"
		for host_addr in `seq 1 254`; do
			ping -c 1 $net_ip.$host_addr | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
		done
	fi
elif [ "$response" == "n" ] || [ "$response" == "N" ]; then
	echo -e "\nSad to see you go. Feel free to come back though."
	echo -e "Goodbye =)"
else
	echo -e "\nYou did not type 'Y' or 'N' but I will get you outta here!"
	echo -e "Goodbye..."
fi
