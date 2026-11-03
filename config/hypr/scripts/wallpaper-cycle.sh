#!/bin/bash

DIR="/home/patrick/Pictures/wallpapers"
WALL=$(find "$DIR" -type f | shuf -n1)

for m in $(hyprctl monitors | awk '/Monitor/ {print $2}'); do
  hyprctl hyprpaper wallpaper "$m,$WALL,cover"
done

# Once per run, not once per monitor: repeated restarts trip systemd's
# start-limit (5 starts / 10s) and leave waybar dead.
wallust -q run "$WALL"
systemctl --user restart waybar.service
