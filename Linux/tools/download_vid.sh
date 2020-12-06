#!/bin/bash 

#colors
green='\033[1;32m'
lightcyan='\033[1;36m'
Blue='\033[0;34m'

dir=$(pwd)

echo ""
read -p $'\033[1;36m[\033[1;32m+\033[1;36m]\033[0;34m Video URL: \e[0m' link 
echo -e "$lightcyan[$green+$lightcyan]$Blue Downloading... $farblos"
curl -L $link > video.html /dev/null 2>&1   
sed -n ''192','192'p' video.html | cut -d '"' -f4 > video.txt  
pic=$(cat video.txt)
curl "$pic" --output $dir/output/$RANDOM.mp4 > /dev/null 2>&1
rm video.html
rm video.txt
echo -e "$lightcyan[$green*$lightcyan]$Blue OK! $farblos"
echo ""
sleep 1