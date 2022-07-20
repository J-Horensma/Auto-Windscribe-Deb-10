#!/bin/bash
#Debian 10 (Kali Compatible) windscape setup, install, and usage bash script
#By: Joel Horensma
clear
printf "\e[1;34m	        _    _ _           _               _ _            \e[0m\n"
printf "\e[1;34m 	       | |  | (_)         | |             (_) |           \e[0m\n"
printf "\e[1;34m 	       | |  | |_ _ __   __| |___  ___ _ __ _| |__   ___   \e[0m\n"
printf "\e[1;34m 	       | |/\| | |  _ \ / _  / __|/ __|  __| | '_ \ / _ \  \e[0m\n"
printf "\e[1;34m 	       \  /\  / | | | | (_| \__ \ (__| |  | | |_) |  __/  \e[0m\n"
printf "\e[1;33m 	        \/  \/|_|_| |_|\__ _|___/\___|_|  |_|_ __/ \___|  \e[0m\n"
printf "\e[1;34m                 	       _   _______ _   _                  \e[0m\n"               
printf "\e[1;34m                 	      | | | | ___ \ \ | |                 \e[0m\n"              
printf "\e[1;34m                 	      | | | | |_/ /  \| |                 \e[0m\n"             
printf "\e[1;34m                 	      | | | |  __/|     |                 \e[0m\n"             
printf "\e[1;34m                 	      \ \_/ / |   | |\  |                 \e[0m\n"            
printf "\e[1;33m                 	       \___/\_|   \_| \_/                 \e[0m\n"
printf "\e[1;34m                                                                  \e[0m\n"           
printf "\e[1;33m################################################################################\e[0m\n" 
printf "\e[1;33mQuick setup, install, and usage script\e[0m\n"
printf "\e[1;33mBy: Joel Horensma\e[0m\n"
echo                              
options=( "Setup And Install" "Start Windscribe" "Stop Windscribe" "Status" "Check Usage" "Login" "Logout" "Connect Best" "Connect To Specific Location" "Disconnect" "Choose Port" "Choose TCP/UDP" "Choose proxy" "Clear proxy settings" "Turn proxy on" "Turn proxy off")
select opt in "${options[@]}"
do
    case $opt in

"Setup And Install")
clear
echo "SET UP AN ACCOUNT THROUGH HERE: https://secure.link/MfnGgi3F"
echo
echo "I am an affiliate with Windscribe and am unoffically promoting it" 
echo "through this bash script that greatly improves the process of Windscribe" 
echo "for Debian 10 (Tested and working on Kali!)"
echo
echo
echo "It comes with 10 free GB of data usage,"
echo "but I will be compensated enough for a couple coffees" 
echo "should you decide to sign up for a 1 month pro account," 
echo "to gain access to more VPN connections around the world!"
echo "Sign up through the link above. ^^^"
echo
echo
read -p "Press Enter to continue"
clear
apt-get install dirmngr apt-transport-https
apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7
sh -c "echo 'deb https://repo.windscribe.com/debian buster main' > /etc/apt/sources.list.d/windscribe-repo.list"
apt-get update
apt-get install windscribe-cli
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Start Windscribe")
clear
sudo /etc/init.d/windscribe-cli start
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Stop Windscribe")
clear
sudo /etc/init.d/windscribe-cli stop
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Status")
clear
windscribe status
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Check Usage")
clear
windscribe account 
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Login")
clear
echo "Sign-in to Windscribe"
echo
echo
windscribe login
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Logout")
clear
windscribe logout
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Connect Best")
clear
sudo windscribe connect best
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Connect To Specific Location")
clear
windscribe locations
echo
echo 
read -p "Enter Location:" LOCATION 
windscribe connect $LOCATION
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Disconnect")
clear
windscribe disconnect
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Choose Port")
clear
read -p "Choose port:" PORT
windscribe port $PORT
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Choose TCP/UDP")
clear
read -p "udp or tcp?:" PROTOCOL
windscribe protocol $PROTOCOL
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Choose proxy")
clear
read -p "Require user/pass? [Yy/Nn] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
clear
read -p "Username:" UNAME
read -p "Password:" PASS
read -p "Host IP (eg 192.172.1.76):" HOST
read -p "Port (eg 8080):" PORT
read -p "Type (eg HTTP, HTTPS, SOCKS5):" TYPE
windscribe proxy --host $HOST --port $PORT --type $TYPE --user $UNAME --password $PASS
echo
read -p "Press Enter to continue"
bash Windscribe.sh
else [[ $REPLY =~ ^[Nn]$ ]]
clear
read -p "Host IP (eg 192.172.1.76):" HOST
read -p "Port (eg 8080):" PORT
read -p "Type (eg HTTP, HTTPS, SOCKS5):" TYPE
windscribe proxy --host $HOST --port $PORT --type $TYPE
echo
read -p "Press Enter to continue"
bash Windscribe.sh
fi
;;
"Clear proxy settings")
clear
windscribe proxy --clear
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Turn proxy on")
clear
windscribe proxy on
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
"Turn proxy off")
clear
windscribe proxy off
echo
read -p "Press Enter to continue"
bash Windscribe.sh
;;
esac
done
