#!/bin/bash 

#colors
green='\033[1;32m'
lightcyan='\033[1;36m'
Blue='\033[0;34m'

dir=$(pwd)

echo ""
read -p $'\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Picture URL: \e[0m' link 
echo -e "$lightcyan[$green+$lightcyan]$Blue Downloading... $farblos"
curl -L $link > picture.html /dev/null 2>&1   
sed -n ''180','180'p' picture.html | cut -d '"' -f4 > picture.txt  
pic=$(cat picture.txt)
curl "$pic" --output $dir/output/$RANDOM.jpg > /dev/null 2>&1
rm picture.html
rm picture.txt
echo -e "$lightcyan[$green*$lightcyan]$Blue OK! $farblos"
echo ""
sleep 1
