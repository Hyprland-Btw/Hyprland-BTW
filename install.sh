#!/bin/bash
# https://github.com/hyprland-btw/Hyprland-BTW

# Message prefixes
ERROR="\e[0;31m[ERROR]\e[0m"
SUCCESS="\e[0;32m[SUCCESS]\e[0m"
WARNING="\e[0;33m[WARNING]\e[0m"
INFO="\e[0;34m[INFO]\e[0m"
PROMPT="\e[0;36m[PROMPT]\e[0m"


# Check if the script is being run as root, if yes then exit
if [[ $EUID -eq 0 ]]; then
    echo -e "$ERROR This script should not be executed as root! Exiting......."
    exit 1
fi

# Check if pulseaudio is installed to avoid conflict with pipewire
if pacman -Qq | grep -q pulseaudio; then
    echo -e "$ERROR Pulseaudio is installed, please remove it before installing pipewire"
    exit 1
fi

# Check if base-devel is installed and install if not
if pacman -Qq | grep -q base-devel; then
    echo -e "$INFO base-devel is already installed"
else
    echo -e "$INFO Installing base-devel"
    if sudo pacman -S --noconfirm --needed base-devel; then
        echo -e "$SUCCESS base-devel installed successfully"
    else
        echo -e "$ERROR Failed to install base-devel"
        exit 1
    fi

fi


echo -e "\e[1;36m _   _                  _                 _           ______ _____ _    _ "
echo -e "| | | |                | |               | |          | ___ \_   _| |  | |"
echo -e "| |_| |_   _ _ __  _ __| | __ _ _ __   __| |  ______  | |_/ / | | | |  | |"
echo -e "|  _  | | | | '_ \| '__| |/ _\` | '_ \ / _\` |  ______  | ___ \ | | | |/\| |"
echo -e "| | | | |_| | |_) | |  | | (_| | | | | (_| |          | |_/ / | | \  /\  /"
echo -e "\_| |_/\__, | .__/|_|  |_|\__,_|_| |_|\__,_|          \____/  \_/  \/  \/ "
echo -e "        __/ | |                                                       "
echo -e "       |___/|_|"
echo
echo -e "https://github.com/hyprland-btw/Hyprland-BTW"
echo
echo
echo -e "Hello dear Arch (btw) user,"
echo -e "Welcome to the Hyprland-BTW installer!\e[0m"
