#!/bin/bash

CHOICE=$(echo -e "Lock\nLogout\nReboot\nShutdown\nSuspend" | rofi -dmenu -p "Power Menu")

case $CHOICE in
    "Lock")
        swaylock
        ;;
    "Logout")
        hyprctl dispatch exit
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
    "Suspend")
        systemctl suspend
        ;;
esac