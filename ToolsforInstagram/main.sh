#!/bin/bash
#coded by Fadester & Turksat46
#v1.0

#colors

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

dir=$(pwd)

if [[ ! -d output ]]; then 
	mkdir output
fi

trap ctrl_c INT
ctrl_c() {
echo ""
echo -e "$lightcyan[$green""1$lightcyan]$Blue Menu $farblos "
echo -e "$lightcyan[$green""2$lightcyan]$Blue Exit $farblos "
echo ""
read -p $'\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Option: \e[0m' option
if [[ $option == "1" ]]; then
	echo ""
	echo -e "$lightcyan[$green+$lightcyan]$Blue Go to Menu... $farblos "
	menu
elif [[ $option == "2" ]]; then
	echo -e "$lightcyan[$red!$lightcyan]$Blue Exiting..."
	sleep 1
	exit
else
	echo -e "$lightcyan[$red!$lightcyan]$Blue Invalid options! "
fi
}

banner() {

echo ""
echo -e "$yellow	d888888b  .d88b.   .d88b.  db    $magenta  d88888b  .d88b.  d8888b.$red d888888b d8b   db .d8888. d888888b  .d8b.   d888b  d8888b.  .d8b.  .88b  d88.   "
echo -e "$yellow	 ~~88~~  .8P  Y8. .8P  Y8. 88    $magenta  88      .8P  Y8. 88   8D$red    88    888o  88 88   YP  ~~88~~  d8   8b 88  Y8b 88   8D d8   8b 88 YbdP 88   "
echo -e "$yellow	   88    88    88 88    88 88    $magenta  88ooo   88    88 88oobY $red    88    88V8o 88  8bo.      88    88ooo88 88      88oobY  88ooo88 88  88  88   "
echo -e "$yellow	   88    88    88 88    88 88    $magenta  88~~~   88    88 88 8b  $red    88    88 V8o88    Y8b.    88    88~~~88 88  ooo 88 8b   88~~~88 88  88  88   "
echo -e "$yellow	   88     8b  d8   8b  d8  88booo.$magenta 88       8b  d8  88  88. $red  .88.   88  V888 db   8D    88    88   88 88. ~8~ 88  88. 88   88 88  88  88   "
echo -e "$yellow           YP     Y88P      Y88P   Y88888P$magenta YP        Y88P   88   YD$red Y888888P VP   V8P  8888Y     YP    YP   YP  Y888P  88   YD YP   YP YP  YP  YP   "
echo ""
echo -e "$cyan<< -- -- ++$BlueF Coded by Fadester & Turksat46$cyan ++ -- -- >> $farblos "
echo -e "$cyan<< -- -- ++$BlueF              v1.0            $cyan ++ -- -- >> $farblos "

}

download_pic() {

sleep 1
bash tools/profilepic.sh
sleep 1
menu

}

follower() {

sleep 1
bash tools/follower.sh
sleep 1
menu

}

menu() {

echo ""
echo -e "$lightcyan[$green""1$lightcyan]$Blue Download profilepicture $farblos "
echo -e "$lightcyan[$green""2$lightcyan]$Blue Follower generator $farblos "
echo -e "$lightcyan[$green""3$lightcyan]$Blue Login watcher $farblos "
echo ""
read -p $'\033[1;36m[\033[1;32m::\033[1;36m]\033[0;34m Choose an option: \e[0m' eingabe
if [[ $eingabe == "1" ]]; then
	download_pic
elif [[ $eingabe == "2" ]]; then
	follower
elif [[ $eingabe == "3" ]]; then
	watcher
fi
}

banner
menu
