#!/bin/bash

# Function to get the active Wi-Fi connection details
get_active_wifi_connection() {
    active_wifi=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
    if [ -n "$active_wifi" ]; then
        echo "Active Wi-Fi: $active_wifi"
    else
        echo "No active Wi-Fi connection"
    fi
}

# Function to connect to a Wi-Fi network
connect_to_wifi() {
    available_wifi=$(nmcli -t -f active,ssid dev wifi | grep '^no' | cut -d':' -f2)
    if [ -n "$available_wifi" ]; then
        selected_wifi=$(echo "$available_wifi" | rofi -dmenu -p "Wi-Fi Network" -lines 8 -width 30)
        if [ -n "$selected_wifi" ]; then
            nmcli dev wifi connect "$selected_wifi"
        fi
    else
        echo "No available Wi-Fi networks"
    fi
}

# Function to disconnect from the current Wi-Fi network
disconnect_wifi() {
    active_wifi=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
    if [ -n "$active_wifi" ]; then
        nmcli dev disconnect iface "$active_wifi"
    else
        echo "No active Wi-Fi connection"
    fi
}

# Function to open the Wi-Fi settings
open_wifi_settings() {
    nm-connection-editor
}

# Function to show information about the network manager
show_about() {
    nmcli -v
}

# Options for Rofi menu
options=("Connect to Network" "Disconnect" "Wi-Fi Settings" "About")

# Join options with newline characters
options_string=$(printf "%s\n" "${options[@]}")

# Get the user's choice
choice=$(echo -e "$options_string" | rofi -dmenu -p "Network Manager" -lines 4 -width 20)

# Handle the user's choice
case $choice in
    "Connect to Network")
        connect_to_wifi
        ;;
    "Disconnect")
        disconnect_wifi
        ;;
    "Wi-Fi Settings")
        open_wifi_settings
        ;;
    "About")
        show_about
        ;;
    *)
        exit 1
        ;;
esac

