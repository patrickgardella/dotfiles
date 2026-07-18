# Hyprland — packages

## Desktop core (must have)

| Package                  | Used by                                     |
| ------------------------ | ------------------------------------------- |
| `hyprland`               | compositor                                  |
| `waybar`                 | status bar                                  |
| `mako`                   | notifications                               |
| `foot`                   | terminal                                    |
| `swaybg`                 | wallpaper                                   |
| `swaylock`               | lock screen                                 |
| `wlogout`                | power menu                                  |
| `rofi-wayland`           | app launcher (SUPER+R)                      |
| `hypridle`               | auto-lock (15 min)                          |
| `hyprpolkitagent`        | privilege escalation prompts                |
| `network-manager-applet` | WiFi/network tray (nm-applet)               |
| `wallust`                | dynamic colors from wallpaper               |
| `open-vm-tools`          | VMware guest tools (auto-resize, clipboard) |

```
sudo pacman -S hyprland waybar mako foot swaybg swaylock wlogout rofi-wayland hypridle hyprpolkitagent network-manager-applet wallust open-vm-tools
```

## Script dependencies

| Package          | Used by                         |
| ---------------- | ------------------------------- |
| `grim` + `slurp` | screenshot (SUPER+S)            |
| `pamixer`        | waybar pulseaudio click-to-mute |

```
sudo pacman -S grim slurp pamixer
```

## Optional (keybinds, can swap)

| Package                | Used by                                        |
| ---------------------- | ---------------------------------------------- |
| `google-chrome-stable` | SUPER+B — or replace with another browser      |
| `pcmanfm-qt`           | SUPER+E — or replace with another file manager |

```
sudo pacman -S google-chrome-stable pcmanfm-qt
```

## Fonts & themes

| Package                           | Notes                                |
| --------------------------------- | ------------------------------------ |
| `ttf-firacode-nerd`               | used in waybar, rofi, foot, swaylock |
| `bibata-modern-cursor` or similar | GTK cursor theme                     |

```
sudo pacman -S ttf-firacode-nerd bibata-modern-cursor
```

## System services (check installed)

- `NetworkManager` — required by nm-applet
- `pipewire-pulse` or `pulseaudio` — required by waybar pulseaudio module
