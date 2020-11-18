#!/bin/bash

green='\033[1;32m'
lightcyan='\033[1;36m'
Blue='\033[0;34m'

dir=$(pwd)

echo ""
read -p $'\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Username: \e[0m' user
echo -e "$lightcyan[$green+$lightcyan]$Blue Downloading... $farblos"
curl -b cookie.$user -L -O https://instagram.com/$user > /dev/null 2>&1
sed -n ''185','185'p' $dir/$user | cut -d '"' -f4 > profilepicture.$user
prof_pic=$(cat profilepicture.$user)
curl "$prof_pic" --output $dir/output/$user > /dev/null 2>&1
rm profilepicture.$user
rm $user
echo -e "$lightcyan[$green+$lightcyan]$Blue OK! $farblos "
sleep 1
