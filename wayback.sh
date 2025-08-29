#!/bin/bash

# Function to display the menu
show_menu() {
    clear
    echo -e "\033[0;37m"
echo "     ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo "     ░  ░░░░  ░░░      ░░░  ░░░░  ░░       ░░░░      ░░░░      ░░░  ░░░░  ░"
echo "     ▒  ▒  ▒  ▒▒  ▒▒▒▒  ▒▒▒  ▒▒  ▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒  ▒▒"
echo "     ▓        ▓▓  ▓▓▓▓  ▓▓▓▓    ▓▓▓▓       ▓▓▓  ▓▓▓▓  ▓▓  ▓▓▓▓▓▓▓▓     ▓▓▓▓"
echo "     █   ██   ██        █████  █████  ████  ██        ██  ████  ██  ███  ██"
echo "     █  ████  ██  ████  █████  █████       ███  ████  ███      ███  ████  █"
echo "     ██████████████████████████████████████████████████████████████████████"
    echo "                           MADE BY:INDIAN CYBER ARMY"
    echo "          YOUTUBE CHANNEL: https://www.youtube.com/@webdragon63"
    echo -e "\033[0;36m __________________________INFORMATION GATHERING TOOL__________________________ "
    echo ""
    echo " [1] WAYBACKURL"
    echo " [2] WAYBACKROBOT"
    echo " [3] WAYBACKROBOTLATEST"
    echo -e " [0]\033[0;31m EXIT"
    echo -e "\033[0;36m"
    echo -n " Please select an option: "
}

# Function to handle the user's selection
handle_choice() {
    case $1 in
        1) bash src/waybackurl.sh;;
        2) bash src/waybackrobot.sh;;
        3) bash src/waybackrobotlatest.sh;;
        0) echo "Exiting..."; exit 0;;
        *) echo "Invalid option";;
    esac
}

# Main loop to show the menu and handle choices
while true; do
    show_menu
    read choice
    handle_choice $choice
    echo -e "\nPress any key to return to the menu..."
    read -n 1
done

