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

current_directory=$(pwd)
echo "export PATH=\$PATH:$current_directory/source" >> ~/.bashrc
source ~/.bashrc

if [ -e "requirements.txt" ]; then
    echo -e "\e[1;32m[\e[34m+\e[1;32m] \e[0mInstalling requirements..."
    pip3 install -r requirements.txt
else
    echo -e "\e[1;31m[\e[34m+\e[1;31m] \e[0mRequirements.txt file not found in the current directory."
    exit 1
fi

echo -e "\e[1;32m[\e[34m+\e[1;32m] \e[0mProcess finished, use the 'relu' command."