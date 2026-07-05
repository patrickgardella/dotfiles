#!/bin/bash
<<<<<<< HEAD

for i in {1..10}; do
    hyprctl hyprpaper list 2>/dev/null && break
    sleep 0.5
done

=======
>>>>>>> f84d809e305b1f14904bf54ca764e7879b282e0a
WALLDIR="$HOME/Pictures/wallpapers"
if [ ! -d "$WALLDIR" ] || [ -z "$(ls -A "$WALLDIR" 2>/dev/null)" ]; then
    exit 0
fi
WALLS=("$WALLDIR"/*)
RAND="${WALLS[$RANDOM % ${#WALLS[@]}]}"
<<<<<<< HEAD
#hyprctl hyprpaper preload "$RAND"
=======
hyprctl hyprpaper preload "$RAND"
>>>>>>> f84d809e305b1f14904bf54ca764e7879b282e0a
hyprctl hyprpaper wallpaper ",$RAND"
for img in "${WALLS[@]}"; do
    [ "$img" != "$RAND" ] && hyprctl hyprpaper unload "$img" 2>/dev/null
done
wallust run -q -s "$RAND"
killall -SIGUSR2 waybar 2>/dev/null
pkill -x mako 2>/dev/null; sleep 0.1; mako &
