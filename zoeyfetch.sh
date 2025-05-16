#!/bin/bash
# zoeyfetch.sh

clear
echo ""

echo -e "\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m"
echo -e "\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m"
echo -e "\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m\e[107m \e[0m" 
echo -e "\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m\e[105m \e[0m"
echo -e "\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m\e[106m \e[0m"

echo ""

neofetch --stdout --disable distro gpu | head -n 16 | tail -n 16

OSpresort=$(echo -ne "OS:" && echo -ne $(lsb_release -a | grep "Description"))

orig="${OSpresort//Description:}"
mod="${orig/Ub/Lub}"
echo $mod  

echo -ne "$(neofetch --stdout | grep GPU | cut -c1-11)Arc B580 12GB"
echo ""

echo ""

echo -e "\e[40m \e[0m\e[41m \e[0m\e[42m \e[0m\e[43m \e[0m\e[44m \e[0m\e[45m \e[0m\e[46m \e[0m\e[47m \e[0m\e[48m"
echo -e "\e[100m \e[0m\e[101m \e[0m\e[102m \e[0m\e[103m \e[0m\e[104m \e[0m\e[105m \e[0m\e[106m \e[0m\e[107m \e[0m\e[108m"
echo ""

# EOF
