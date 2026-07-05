#!/bin/bash

DIR="$HOME/Pictures/wallpapers"
WALL=$(find "$DIR" -type f | shuf -n1)

hyprctl hyprpaper wallpaper ",$WALL,cover"
