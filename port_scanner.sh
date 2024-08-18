#!/bin/bash
set -e

#Remind myself that I plan on providing improvement to this code, which means other versions of this will be released.

line="========================================================"

echo $line
echo "       Welcome to Port Scanner - by Igor Oliveira       "
echo $line
echo 

echo -e "\nThis port scanner will ask you for a target's address."
echo "You have the option to enter the target's IP Address"
echo "or the domain name followed by the top level domain"
echo i"in the following format: SiteDomain.tld."
echo -n -e "\nStart Scanner [Y] or [N]: "
read answer

if [ $answer == "y" ] || [ $answer == "Y" ]; then
	echo
	echo $line
	echo "                Starting Port Scanner                "
	echo $line
	echo -n -e "\nEnter the IP address or webpage: "
	read target #Comments on this specific part of the program are for me to remember to launch improved versions of this code. It's all planned on my notes on Notion.
	echo
	sudo nmap -sS -p 21,22,23,25,53,66,67,80,125,143,161,445,160,161,443,8000,8080 $target #Again, comment here are for me to remember to look on the plan for this project on my personal notes on Notion.

	echo
	echo $line
	echo "                   Starting OS Scan                   "
	echo $line
	echo
	sudo nmap -o $target # Include a for look here.
elif [ $answer == "n" ] || [ $answer == "N" ]; then
	echo -e "\nThank you!"
else 
	echo -e "\nNext time, you can type 'N' to leave the program or 'Y' to start scanning."
	echo "Hope to see you again, goodbye!"
fi
