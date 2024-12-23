# vice-jz-nosnap v4

# required packages: sudo

# required tweaks: Your user must be in the sudoers file.

# changelog:
# v2 fixed sound by not running vice as root
# v3 fixed drives by actually copying all required deps
# v4 updated the top of this file to mention the required packages to install/stuff needed

# Usage: sudo bash ./vice-jz-nosnap.sh

# because pclinuxos doesn't do snaps.


if [[ $EUID -ne 0 ]]; then
    clear && echo "$0 is not running with sudo. Try using sudo."
    echo ""
    exit 2
fi


cd "$(dirname "$0")"
mkdir vice-jz-nosnap
cd vice-jz-nosnap
sudo curl -H 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/vice-jz >> vice-jz.info
echo AMOG

rm -rf out1.txt
#echo "maybe problematic"
sudo curl -H 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/vice-jz | jq
#echo "maybe problematic"
clear
clear
clear
cat ./vice-jz.info | grep "http*" | grep "http" | grep .snap > out1.txt
cat out1.txt | grep .snap
awk '!seen[$0]++' out1.txt
awk -i inplace '!seen[$0]++' out1.txt
cat out1.txt
clear
#sort -u out1.txt > out1.txt
cat out1.txt
clear
#awk '{if (++dup[$0] == 1) print $0;}' out1.txt > out1.txt
#cat out1.txt

gawk -i inplace 'FNR==1{delete a} !a[$0]++' out1.txt
clear
cat out1.txt | grep ".snap"

clear

#sort out1.txt | uniq > out2.txt
#cat out2.txt
rm -rf out2.txt
clear
clear
clear
clear
clear
clear
clear
#cat out1.txt | cut -d "}" -f 2

rm -rf out3.txt
# gather version
cat out1.txt | grep "" > out3.txt
clear


sleep 1s
rm -rf out4.txt

echo "Link gathered:"
sort -k2,2 -u < out3.txt | sort -k4,4n > out4.txt
sort -k2,2 -u < out3.txt | sort -k4,4n
echo ""
cat out4.txt
echo "Downloading snap as .snap..."
echo AMOGUS
echo $(cat out4.txt | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | sort -u) > out5.txt
wget $(grep "" out5.txt)
echo ""
echo "Extracting squashfs..."
sudo rm -rf *.snap.1
sudo rm -rf ./squashfs-root
sudo rmdir ./squashfs-root
# DELETE SNAPS THAT ARE UNWANTED HERE
sudo rm -rf *UNWANTED.snap

echo ""
# cleanup is required

sudo rm -rf *.snap.*

sudo rm -rf *.info
sudo rm -rf vice-jz

sudo rm -rf *.txt

# COMMENT OUT THE ONE YOU WANT TO RUN, LEAVE ALL THE REST NORMAL
sudo rm -rf *1*.snap

sudo rm -rf *83.snap # dies with exec file error, do not use
#sudo rm -rf *84.snap # THIS VERSION WORKS, LEAVE THIS FILE AS-IS NOW!!
sudo rm -rf *85.snap
sudo rm -rf *86.snap
sudo rm -rf *87.snap
sudo rm -rf *88.snap

sudo unsquashfs ./$(ls | grep .snap)

sudo apt install -y strace
echo "Copying required C64 stuff into where vice will look for it..."
sudo mkdir ./squashfs-root/current
sudo cp -rf ./squashfs-root/lib64/ ./squashfs-root/current/
sudo cp -rf ./squashfs-root/lib64/vice/C64 ./squashfs-root/bin/
sudo cp -rf ./squashfs-root/lib64/vice/DRIVES ./squashfs-root/bin/
sudo cp -rf ./squashfs-root/lib64/vice/* ./squashfs-root/bin/

echo "Executing vice x64..."
cd squashfs-root
cd bin
sudo rm -rf ../../*.snap
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
echo "NOW EXITING MY SCRIPT AND RUNNING THE VICE EMULATOR, ENJOY!"
echo ""
clear
echo "Run the following inside of a fresh non-root Terminal to run VICE x64:"
echo ""
readlink -f ./x64


# done
