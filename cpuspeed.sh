#
# cpuspeed.sh

cleanup() {
    tput cnorm
}

trap cleanup EXIT

tput civis
while true
do

sleep 0.1s # this line stops this tool using up all of your cpu usage itself
echo ""
final=$(sudo cat /proc/cpuinfo | grep "MHz" | perl -lane '$m<$_ and $m=$_ for @F; print $m' | tr " " "\n" | sort -nr | head -n 1)
clear && printf "                                                                   $final MHz" && echo "                                                                      cpu speed"
echo ""
done
