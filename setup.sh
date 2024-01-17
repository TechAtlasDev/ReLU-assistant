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
\e[0m"

if [ "$EUID" -ne 0 ]; then
    echo -e "\e[1;31m[\e[34m+\e[1;31m] \e[0mThis system requires you to run this with sudo permissions (sudo)\e[0m"
    exit 1
fi

if ! command -v python3 &> /dev/null; then
    echo -e "\e[1;31m[\e[34m+\e[1;31m] \e[0mThis system requires Python 3 to be installed.\e[0m"
    exit 1
fi

if [ -e "requirements.txt" ]; then
    echo -e "\e[1;32m[\e[34m+\e[1;32m] \e[0mInstalling requirements..."
    sudo pip3 install -r requirements.txt
else
    echo -e "\e[1;31m[\e[34m+\e[1;31m] \e[0mRequirements.txt file not found in the current directory."
    exit 1
fi

if [ -d "source" ]; then
    echo -e "\e[1;32m[\e[34m+\e[1;32m] \e[0mMoving contents of the source folder to /usr/local/bin and ~/.relu"
    sudo mkdir ~/.relu
    rsync -a --exclude='moduls.py' source/utils_relu/ ~/.relu/
    sudo mkdir /usr/local/bin/utils_relu
    sudo cp -r source/utils_relu/moduls.py /usr/local/bin/utils_relu
    echo -e "\e[1;32m[\e[34m+\e[1;32m] \e[0mDeleting the source folder"
    rm -rf source
else
    echo "No se encontró la carpeta source en el directorio actual."
    exit 1
fi

# Eliminar todo lo que se encuentra en el directorio local
echo "Eliminando el contenido del directorio local..."

echo "Proceso completado exitosamente."
