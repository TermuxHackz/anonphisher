#!/bin/bash
#installation

clear

echo ""
echo -e "\e[1;34m Installing \e[0m\e[1;35mRequirements into your terminal.. \e[0m"
sleep 0.5
pip install lolcat
pkg install figlet
pkg install unzip
pkg install zip
sleep 1
echo "Requirements fully installed... " | lolcat
sleep 1
clear

echo ""
echo " FOLLOW MY REPO 🔔 " | lolcat
xdg-open https://github.com/TermuxHackz 
echo ""

echo -e "\e[101m Press Enter \e[0m"
read a1

sleep 1
clear

echo "Loading..." | lolcat
sleep 1
clear

echo "Loading..." | lolcat
sleep 1
clear

echo "Loading..." | lolcat
sleep 1
clear


echo "Dont run bash install.sh again.. " | lolcat
sleep 0.5
echo ""

sleep 0.5
echo -e "\e[101m NOTE: DONT RUN bash install.sh again \e[0m"
sleep 0.5
echo "Phishing tool created by AnonyminHack5" | lolcat

echo ""
menu() {
sleep 0.5
printf "\e[1;97mDo you Need my telegram bot?\e[0m"
sleep 0.5
printf "\n"
sleep 0.5
printf "\e[1;97m[01]\e[0m\e[1;92m Yes\e[0m\n"
sleep 0.5
printf "\e[1;97m[02]\e[0m\e[1;92m No\e[0m\n"
sleep 0.5
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose: \e[0m\en' option

if [[ $option == 1 || $option == 01 ]]; then
echo -e "\e[1;93m Nice choice... Haha😋\e[0m"
sleep 0.5
echo -e "\e[1;92m Press enter to view my telegram bot.. \e[0m"
read a1
termux-open-url https://t.me/Termux1_bot
cd $HOME
cd anonphisher 
rm -rf install.sh
printf "\e[1;92m[\e[0m\e[1;77m!\e[0m\e[1;92m]\e[0m\e[1;93m RUN bash anonphisher.sh\e[0m\n" 


elif [[ $option == 2 || $option == 02 ]]; then
echo -e "\e[1;94m Ouch... Bad choice\e[0m"
sleep 0.5
echo -e "\e[1;93m Leave!!🙄... Haha😝\e[0m"
sleep 2
cd $HOME
cd anonphisher 
rm -rf install.sh
printf "\e[1;92m[\e[0m\e[1;77m!\e[0m\e[1;92m]\e[0m\e[1;93m RUN bash anonphisher.sh\e[0m\n" 
exit 1

else
printf "\e[1;93m [!] Wrong option\e[0m\n"
clear
menu
fi
}

menu
