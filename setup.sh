#!/bin/bash
clear

echo -e "\e[32m
 ▄▄▄▄▄▄              ▄▄        ▄▄    ▄▄ 
 ██▀▀▀▀██            ██        ██    ██ 
 ██    ██   ▄████▄   ██        ██    ██ 
 ███████   ██▄▄▄▄██  ██        ██    ██ 
 ██  ▀██▄  ██▀▀▀▀▀▀  ██        ██    ██ 
 ██    ██  ▀██▄▄▄▄█  ██▄▄▄▄▄▄  ▀██▄▄██▀ 
 ▀▀    ▀▀▀   ▀▀▀▀▀   ▀▀▀▀▀▀▀▀    ▀▀▀▀ 

TechAtlasDev -> https://github.com/TechAtlasDev
\e[0m"

if ! command -v python3 &> /dev/null; then
    echo -e "\e[1;31m[\e[34m+\e[1;31m] \e[0mThis system requires Python 3 to be installed.\e[0m"
    exit 1
fi

if [ -e "requirements.txt" ]; then
    echo -e "\e[1;32m[\e[34m+\e[1;32m] \e[0mInstalling requirements..."
    pip3 install -r requirements.txt
else
    echo -e "\e[1;31m[\e[34m+\e[1;31m] \e[0mRequirements.txt file not found in the current directory."
    exit 1
fi

echo "--------------------------------------------------"

echo -e "\e[1;32m[\e[34m+\e[1;32m] \e[0mEl sistema terminó de instalar las dependencias, \e[1;31mahora ejecuta el siguiente comando para que ReLU pueda ejecutarse en tu terminal:\e[0m"
echo -e "\e[1;36m[\e[34m+\e[1;36m] \e[0m    export PATH=\$PATH:./source"

echo -e "\n\e[1;32m[\e[34m+\e[1;32m] \e[0mThe system finished installing the dependencies, \e[1;31mnow run the following command so that ReLU can run in your terminal:\e[0m"
echo -e "\e[1;36m[\e[34m+\e[1;36m] \e[0m    export PATH=\$PATH:./source"
