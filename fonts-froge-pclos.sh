#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    clear && echo "$0 is not running with sudo. Try using sudo."
    echo ""
    exit 2
fi

sudo apt install -y google-noto*



