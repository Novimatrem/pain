#!/bin/bash
clear
clear
clear
if [[ $EUID -ne 0 ]]; then
    clear && echo "$0 is not running with sudo. Try using sudo."
    echo ""
    exit 2
fi

read -p "Enter package name to search for: " INPUT

apt update && apt dist-upgrade && apt-get update && apt-get dist-upgrade
clear
apt-cache search $INPUT | grep $INPUT
echo ""

