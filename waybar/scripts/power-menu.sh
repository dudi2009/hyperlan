#!/bin/bash

# Dapatkan informasi user
USER=$(whoami)

# Fungsi untuk eksekusi perintah dengan privilege
execute_command() {
    case $1 in
        "lock")
            swaylock
            ;;
        "logout")
            if [[ "$DESKTOP_SESSION" == "hyprland" ]]; then
                hyprctl dispatch exit
            else
                loginctl terminate-user $USER
            fi
            ;;
        "reboot")
            systemctl reboot
            ;;
        "shutdown")
            systemctl poweroff
            ;;
        "suspend")
            systemctl suspend
            ;;
    esac
}

# Tampilkan menu menggunakan wofi
CHOICE=$(echo -e "Lock\nLogout\nReboot\nShutdown\nSuspend" | wofi --show dmenu --prompt "Power Menu")

# Eksekusi pilihan
case $CHOICE in
    "Lock")
        execute_command "lock"
        ;;
    "Logout")
        execute_command "logout"
        ;;
    "Reboot")
        execute_command "reboot"
        ;;
    "Shutdown")
        execute_command "shutdown"
        ;;
    "Suspend")
        execute_command "suspend"
        ;;
esac