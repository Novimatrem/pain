#!/bin/bash
# fix-discord-quiet.sh

setlocal enabledelayedexpansion

# find the discord making the noises
clear
DISCORD=$(clear && pacmd list-sink-inputs | tr '\n' '\r' | perl -pe 's/.*? *index: ([0-9]+).+?application\.name = "([^\r]+)"\r.+?(?=index:|$)/\2:\1\r/g' | tr '\r' '\n' | grep Firefox | uniq | awk '{$1=$1};1')
echo $DISCORD 
echo ""


# it seems to always be two. split this into two separate variables.
echo DISCORDA
DISCORDA=$(echo "$DISCORD" | grep -oE "[0-9]*" | sort -nr | head -n 1 | tail -1)
echo $DISCORDA
echo ""

echo DISCORDB
DISCORDB=$(echo "$DISCORD" | grep -oE "[0-9]*" | sort -nr | head -n 2 | tail -1)
echo $DISCORDB
echo ""

echo "Maxing volumes..."
# do the actual setting of the volume
pacmd set-sink-input-volume $DISCORDA 100535
pacmd set-sink-input-volume $DISCORDB 100535
echo ""
echo "Done."
echo ""
