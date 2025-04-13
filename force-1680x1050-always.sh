# force-1680x1050-always-v2.sh

# this entire script runs perpetually and is as such a loop
while true;
do

# sleep to not cause the system to overload on checks
sleep 1s

# check if we even need to run this script

#rescheck=$(xrandr | grep  " connected\|\*" | grep 1680x1050) # TODO: LINE CAUSES BIG LAG, FIND ALTERNATIVE!!!!!!!!

rescheck=$(xdpyinfo | grep dimensions | grep 1680x1050) # much better, much faster

if [ -z "$rescheck" ]; then
clear
echo Checking... && echo "" && echo We are not at 1680x1050, continuing. && echo "" && echo "Correcting video mode..." && echo ""
else
clear
echo Checking... && echo "" && echo We are already at 1680x1050, looping script. && echo "" && continue
fi

# gather the name and hz of the 1680x1050 mode
randvar="$(xrandr -d :0 | grep 1680 | sed -e 's/\s+/ /g' | tr -s ' ' | sed 's/^ *//')"

# replace the spaces with underscores
randvarnospace=$(echo $randvar | tr -s ' ' | tr ' ' '_')

# fix bug in steam notifications
killall steam
pkill steam

# print and then set it
echo $randvarnospace
xrandr -s $randvarnospace
echo ""
echo "Done."
done
