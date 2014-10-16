#!/bin/bash
echo Please choose one \(add, delete, list\)
read answer

if [[ "$answer" == "add" || "$answer" == "a" ]]
then
	echo Please enter IP address you want to add to iptables
	read ip
	sudo iptables -A INPUT -s $ip -j DROP
	sudo iptables -A OUTPUT -d $ip -j DROP
	echo IP address $ip has been added to iptables
	exit 0
elif [[ "$answer" == "delete" || "$answer" == "d" ]]
then
echo Please enter IP address you want to delete from iptables
        read ip
        sudo iptables -D INPUT -s $ip -j DROP
        sudo iptables -D OUTPUT -d $ip -j DROP
        echo IP address $ip has been deleted from iptables
	exit 0
elif [[ "$answer" == "list" || "$answer" == "l" ]]
then
	sudo iptables --list
	exit 0
else
	echo $"Usage: $0 {add|delete|list}"
	exit 1
fi
