#!/bin/bash

mkdir ~/tools
cd ~/tools

echo -e "\e[1;33m[+] Installing naabu\e[0m" 
git clone https://github.com/projectdiscovery/naabu.git
cd naabu/v2/cmd/naabu
go build
sudo cp naabu /usr/local/bin
naabu -version
cd ~/tools

echo -e "\e[1;33m[+] Installing HTTPX\e[0m"
git clone https://github.com/projectdiscovery/httpx.git
cd httpx/cmd/httpx
go build
sudo cp httpx /usr/local/bin
httpx -version
cd ~/tools

echo -e "\e[1;33m[+] Installing Nuclei\e[0m"
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
git clone https://github.com/projectdiscovery/nuclei-templates.git
cd ~/tools

echo -e "\e[1;33m[+] Installing Notify\e[0"
GO111MODULE=on go get -v github.com/projectdiscovery/notify/cmd/notify
GO111MODULE=on go get -v github.com/projectdiscovery/notify/cmd/intercept
echo -e "\e[1;33m[+] Add configuration to this file : $HOME/.config/notify/notify.conf\e[0"
