#!/bin/bash

if [ -d ~/recon/$1/$(date +"%d-%m-%Y") ]
then
        echo -e "\e[1;33m[+] Direcotry already exists\e[0m"
else
        mkdir -p ~/recon/$1/$(date +"%d-%m-%Y")
        echo -e "\e[1;33m[+] Direcotry Created\e[0m"
fi

echo -e "\e[1;33m[+] Running naabu\e[0m"
cat ~/recon/$1/$(date +"%d-%m-%Y")/cidr.txt | naabu -p- -verify -o ~/recon/$1/$(date +"%d-%m-%Y")/ports.txt

echo -e "\e[1;33m[+] Running HTTPX\e[0m"
cat ports.txt | httpx -title -status-code -web-server -vhost >> ~/recon/$1/$(date +"%d-%m-%Y")/httpx.txt

echo -e "\e[1;33m[+] Running nuclei\e[0m"
cat cidr.txt | naabu -silent -p - | httpx -silent | nuclei -t ~/tools/ nuclei-templates/ >> ~/recon/$1/$(date +"%d-%m-%Y")/nuclei.txt
