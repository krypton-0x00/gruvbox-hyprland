#!/usr/bin/env bash

THEME="$HOME/.config/rofi/powermenu/powermenu.rasi"

options=(
  "  Lock"
  "󰍃  Logout"
  "󰤄  Suspend"
  "󰜉  Reboot"
  "  Shutdown"
)

choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -i -theme "$THEME" -p "Power")

case "$choice" in
  *Lock)      loginctl lock-session ;;
  *Logout)    hyprctl dispatch exit || pkill -KILL -u "$USER" ;;
  *Suspend)   systemctl suspend ;;
  *Reboot)    systemctl reboot ;;
  *Shutdown)  systemctl poweroff ;;
esac

