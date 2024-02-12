#!/bin/bash

# Define the folder path containing your themes
themes_folder="/home/harrek/Themes"

# List all the files in the themes folder
themes=$(ls "$themes_folder")

# Use Rofi to create a menu from the theme filenames
selected_theme=$(echo "$themes" | rofi -dmenu -p "Select a theme:")

# Check if a theme was selected
if [ -n "$selected_theme" ]; then
    # Execute the wal command with the selected theme
    kitty wal --theme "$themes_folder/$selected_theme"
fi
