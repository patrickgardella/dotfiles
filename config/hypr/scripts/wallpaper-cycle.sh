#!/bin/bash

DIR="/home/patrick/Pictures/wallpapers"
WALL=$(find "$DIR" -type f | shuf -n1)

for m in $(hyprctl monitors | awk '/Monitor/ {print $2}'); do
   hyprctl hyprpaper wallpaper "$m,$WALL,cover"
 done
