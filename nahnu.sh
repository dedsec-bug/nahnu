#!/bin/bash

echo -e "\e[1;33m[+] Running naabu\e[0m"
cat cidr.txt | naabu -p- -verify -o ports.txt

echo -e "\e[1;33m[+] Running HTTPX\e[0m"
cat ports.txt | httpx -title -status-code -web-server -vhost

echo -e "\e[1;33m[+] Running nuclei\e[0m"
cat cidr.txt | naabu -silent -p - | httpx -silent | nuclei -t ~/tools/ nuclei-templates/ | notify
