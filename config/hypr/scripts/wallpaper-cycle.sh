#!/bin/bash
WALLDIR="$HOME/Pictures/wallpapers"
WALLS=("$WALLDIR"/*)
RAND="${WALLS[$RANDOM % ${#WALLS[@]}]}"
pkill swaybg 2>/dev/null
swaybg -i "$RAND" -m fill &
wallust run -q -s "$RAND"
killall -SIGUSR2 waybar 2>/dev/null
pkill -x mako 2>/dev/null; sleep 0.1; mako &
