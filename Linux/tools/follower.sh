#!/bin/bash

echo ""

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
lightmagenta='\e[105m'

dir=$(pwd)

clear

echo ""
echo -e " $green ___________    .__  .__                               $farblos  "
echo -e " $green \_   _____/___ |  | |  |   ______  _  __ ___________   $farblos  "
echo -e " $green  |    __)/  _ \|  | |  |  /  _ \ \/ \/ // __ \_  __ \  $farblos  "
echo -e " $green  |     \(  <_> )  |_|  |_(  <_> )     /\  ___/|  | \/  $farblos  "
echo -e " $green  \___  / \____/|____/____/\____/ \/\_/  \___  >__|     $farblos  "
echo -e " $green      \/                                     \/         $farblos  "                                                 
echo ""
echo -e " $magenta  .+oooooooooooooooooooooooooooooooo+.  $farblos"
echo -e " $magenta  /oooooooooooooooooooooooooooooooooo/  $farblos"
echo -e " $magenta  /oooooooooo+/::+ooooooooooooooooooo+  $farblos"
echo -e " $magenta  /ooooooooo:     :ooooooo:/ oooooooo+  $farblos"
echo -e " $magenta  /ooooooooo:     :ooooooo/  oooooooo+  $farblos"
echo -e " $magenta  /oooooooooo:-  :+oooooooo: oooooooo+  $farblos"
echo -e " $magenta  /ooooooo+:       :+oooooo: oooooooo+  $farblos"
echo -e " $magenta  /ooooooo           +ooooo: oooooooo+  $farblos"
echo -e " $magenta  /ooooooo+//////////oooooooooooooooo+  $farblos"
echo -e " $magenta  :oooooooooooooooooooooooooooooooooo: $farblos" 
echo -e " $magenta   :+oooooooooooooooooooooooooooooo+: $farblos"   
echo -e " $magenta              -/oooooooo/-  $farblos "   
echo -e " $magenta                -oooooo-   $farblos"              
echo -e " $magenta                 .+oo+.  $farblos"                
echo -e " $magenta                  \../  $farblos"
echo ""

login_fail() {
rm cookie.$user > /dev/null 2>&1
echo ""
echo -e "$lightcyan[$green""1$lightcyan]$Blue Menu $farblos "
echo -e "$lightcyan[$green""2$lightcyan]$Blue Try again $farblos "
echo ""
read -p $'\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Option: \e[0m' option1

if [[ $option1 == "1" ]]; then
  echo -e "$lightcyan[$greem+$lightcyan]$Blue Go to menu..."
  bash $dir/main.sh
elif [[ $option1 == "2" ]]; then
  bash $dir/tools/follower.sh
else
  echo -e "$lightcyan[$red!$lightcyan]$Blue Invalid option!"
fi


}

#variablen
phone="$string8-$string4-$string4-$string4-$string12"
var2=$(echo $var | grep -o 'csrftoken=.*' | cut -d ';' -f1 | cut -d '=' -f2)
guid="$string8-$string4-$string4-$string4-$string12"
string4=$(openssl rand -hex 32 | cut -c 1-4)
string12=$(openssl rand -hex 32 | cut -c 1-12)
string8=$(openssl rand -hex 32  | cut -c 1-8)
string16=$(openssl rand -hex 32 | cut -c 1-16)
device="android-$string16"
header='Connection: "close", "Accept": "*/*", "Content-type": "application/x-www-form-urlencoded; charset=UTF-8", "Cookie2": "$Version=1" "Accept-Language": "en-US", "User-Agent": "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'
data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'
uuid=$(openssl rand -hex 32 | cut -c 1-32)
ig_sig="4f8732eb9ba7d1c8e8897a75d6474d4eb3f5279137431b2aafb71fafe2abe178"
dir=$(pwd)

read -p $'\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Username: \e[0m' user
printf "\033[1;36m[\033[1;32m*\033[1;36m]\033[0;34m Check username... \e[0m"

checkacc=$(curl -L -s https://instagram.com/$user/ | grep -c "the page may have been removed")
if [[ $checkacc == 1 ]]; then
	echo $red FAIL! $farblos
	echo -e "$lightcyan[$red!$lightcyan]$red User not exist! $farblos"
	bash $dir/tools/follower.sh
else
	echo -e $green OK! $farblos
fi
if [[ -e cookie.$user ]]; then
    echo -e "$lightcyan[$green+$lightcyan]$Blue Cookies for $user found! $farblos"
    read -p $'\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Use cookie? [Y/n] \e[0m' usecookie
    if [[ $usecookie == "y" || $usecookie == "Y" ]]; then
        echo -e "$lightcyan[$green+$lightcyan]$Blue Use saved cookie $farblos "
        echo "" 
    else
		rm cookie.$user 
	fi

else

read -s -p $'\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Password: \e[0m' pass

data='{"phone_id":"'$phone'", "_csrftoken":"'$var2'", "username":"'$user'", "guid":"'$guid'", "device_id":"'$device'", "password":"'$pass'", "login_attempt_count":"0"}'
hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
useragent='User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"'

var=$(curl -c cookie.$user -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/accounts/login/" | grep -o "logged_in_user\|challenge\|many tries\|Please wait" | uniq );

echo ""
echo -e "$lightcyan[$green+$lightcyan]$Blue Try to login as $green$user... $farblos"
sleep 1
echo ""
if [[ $var == "challenge" ]]; then echo -e "$lightcyan[$green+$lightcyan]$Blue Login successful! \n $farblos" ; elif [[ $var == "logged_in_user" ]]; then echo -e "$lightcyan[$green+$lightcyan]$Blue Login successful! \n $farblos" ; elif [[ $var == "Please wait" ]]; then echo -e "$lightcyan[$red!$lightcyan]$lightred Login Fail! Blocked! Wait 2min $farblos" ; sleep 120 ; else echo -e "$lightcyan[$red!$lightcyan]$Blue Login failed!$yellow Maybe your Account have a 2FA? $farblos" ; login_fail  ; fi ;
fi


read -p $'\033[1;36m[\033[1;32m*\033[1;36m]\033[0;34m How often should the algorithm run? [leave it empty for no limit]: \e[0m' algo
echo ""
if [[ $algo == " " ]]; then 
algo=0
fi

#ids

username_id=$(curl -L -s 'https://www.instagram.com/'$user'' > getid && grep -o  'profilePage_[0-9]*.' getid | cut -d "_" -f2 | tr -d '"')

id1="460563723"
id2="26669533"
id3="7719696"
id4="247944034"
id5="173560420"
id6="18428658"
id8="232192182"
id9="12281817"
id10="305701719"
id11="427553890"
id12="12331195"
id13="325734299"
id14="212742998"
id15="407964088"
id16="7555881"
id17="177402262"
id18="19596899"
id19="181306552"
if20="1506607755"
id21="184692323"
id22="11830955"
id23="25025320"

if [[ ! -e ids.txt ]]; then

	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" $id1 $id2 $id3 $id4 $id5 $id6 $id7 $id8 $id9 $id10 $id11 $id12 $id13 $id14 $id15 $id16 $id17 $id17 $if18 $id19 $id20 $id21 $id22 $id23 > ids.txt

fi

ID="ID"
num=1

while [[ true ]]; do
	run=0

	_day=$(date | cut -d " " -f2)
	_month=$(date | cut -d " " -f3)
	_time=$(date | cut -d " " -f4)
	#follow
	let num=1
	for idss in $(cat ids.txt); do
		data='{"_uuid":"'$guid'", "_uid":"'$username_id'", "user_id":"'$idss'", "_csrftoken":"'$var2'"}'
		hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
		printf "\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Try to follow %s \e[0m" $ID$num
		check_follow=$(curl -s -L -b cookie.$user -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/friendships/create/$idss/" | grep -o '"following": true')
		if [[ $check_follow == "" ]]; then
			echo -e "$red FAIL! $farblos"
      clear
      sleep 3
      bash $dir/Hacksta
		else
			echo -e "$green OK! $farblos "
		fi
		sleep 3
		let num++
	done
    echo -e "$lightcyan[$green*$lightcyan]$Blue Wait 1min... $farblos"
	sleep 60
	#unfollow
	let num=1
	for idss in $(cat ids.txt); do
		data='{"_uuid":"'$guid'", "_uid":"'$username_id'", "user_id":"'$idss'", "_csrftoken":"'$var2'"}'
		hmac=$(echo -n "$data" | openssl dgst -sha256 -hmac "${ig_sig}" | cut -d " " -f2)
		printf "\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Try to unfollow %s \e[0m" $ID$num
		check_unfollow=$(curl -s -L -b cookie.$user -d "ig_sig_key_version=4&signed_body=$hmac.$data" -s --user-agent 'User-Agent: "Instagram 10.26.0 Android (18/4.3; 320dpi; 720x1280; Xiaomi; HM 1SW; armani; qcom; en_US)"' -w "\n%{http_code}\n" -H "$header" "https://i.instagram.com/api/v1/friendships/destroy/$idss/" | grep -o '"following": false' )
		if [[ check_unfollow == "" ]]; then
			echo -e "$red FAIL! $farblos"
			sleep 4
      clear
      bash $dir/Hacksta
		else
			echo -e "$green OK! $farblos"
		fi
		sleep 3
		let num++
	done
	let run++
	if [[ $run == $algo ]]; then 
			echo -e "$lightcyan[$green!$lightcyan]$Blue Finish! $farblos"
			sleep 1
			bash $dir/Hacksta
	fi
	echo -e "$lightcyan[$green*$lightcyan]$Blue Wait 1min... $farblos"
	sleep 60
done
