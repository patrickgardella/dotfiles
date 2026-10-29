#!/usr/bin/env bash

export XDG_RUNTIME_DIR="/run/user/$(id -u)"

if [ -d "$XDG_RUNTIME_DIR/hypr" ]; then
  export HYPRLAND_INSTANCE_SIGNATURE=$(ls -t "$XDG_RUNTIME_DIR/hypr" | head -n 1)
else
  echo "Error: Hyprland runtime directory not found." >&2
fi

export WAYLAND_DISPLAY=$(ls -t "$XDG_RUNTIME_DIR" | grep '^wayland-' | head -n 1)
