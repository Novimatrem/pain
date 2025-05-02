# steam-unignore-all-games-thanks-for-nothing-steam-support.sh

# i asked steam support to do this for me and they couldn't so.. script

# set these coordinates to be that of the (X) button to unignore
# on the page https://store.steampowered.com/account/notinterested/
#
CURPOS="xdotool mousemove 1590 485"
#

clear

LOOPCOUNT=31 # slightly higher to account for this UI missing inputs?!
sleep 1s
echo Steam Unignorer
# loop here
while true
do


$(echo $CURPOS)
xdotool click 1
echo $LOOPCOUNT
sleep 1s
xdotool key Home
LOOPCOUNT=$(echo "$(($LOOPCOUNT-1))")


if [ $LOOPCOUNT == 0 ]
then
xdotool key F5
sleep 1s
xdotool key Home
sleep 1s
LOOPCOUNT=31 # slightly higher to account for this UI missing inputs?!
clear
echo Steam Unignorer
fi

done
# loop end here
