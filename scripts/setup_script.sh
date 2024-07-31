#!/bin/bash

# Function to display the banner
display_banner() {
    echo " /$$$$$$$                      /$$       /$$     /$$                               /$$          "
    echo "| $$__  $$                    |__/      |  $$   /$$/                              |__/          "
    echo "| $$  \ $$  /$$$$$$  /$$$$$$$  /$$       \  $$ /$$/$$$$$$   /$$$$$$  /$$$$$$/$$$$  /$$ /$$$$$$$ "
    echo "| $$$$$$$  /$$__  $$| $$__  $$| $$        \  $$$$/$$__  $$ |____  $$| $$_  $$_  $$| $$| $$__  $$"
    echo "| $$__  $$| $$  \ $$| $$  \ $$| $$         \  $$/ $$$$$$$$  /$$$$$$$| $$ \ $$ \ $$| $$| $$  \ $$"
    echo "| $$  \ $$| $$  | $$| $$  | $$| $$          | $$| $$_____/ /$$__  $$| $$ | $$ | $$| $$| $$  | $$"
    echo "| $$$$$$$/|  $$$$$$/| $$  | $$| $$          | $$|  $$$$$$$|  $$$$$$$| $$ | $$ | $$| $$| $$  | $$"
    echo "|_______/  \______/ |__/  |__/|__/          |__/ \_______/ \_______/|__/ |__/ |__/|__/|__/  |__/"
    echo "                                                                                                 "
    echo "                                                                                                 "
    echo "                           ,,))))))));,"
    echo "           __)))))))))))))),"
    echo "\|/       -\(((((''''((((((((."
    echo "-*-==//////((''  .     `)))))),"
    echo "/|\\      ))| o    ;-.    '(((((                                  ,(,"
    echo "         ( \`|    /  )    ;))))'                               ,_))^;(~"
    echo "            |   |   |   ,))((((_     _____------~~~-.        %,;(;(>';'~"
    echo "            o_);   ;    )))(((` ~---~  \`::           \      %%~~)(v;(`('~"
    echo "                  ;    ''''````         \`:       \`:::|\,__,%%    );\`'; ~"
    echo "                 |   _                )     /      \`:|`----'     `-'"
    echo "           ______/\/~    |                 /        /"
    echo "         /~;;.____/;;'  /          ___--,-(   \`;;;/"
    echo "        / //  _;______;'------~~~~~    /;;/\    /"
    echo "       //  | |                        / ;   \;;,\\"
    echo "      (<_  | ;                      /',/-----'  _>"
    echo "       \_| ||_                     //~;~~~~~~~~~"
    echo "           \`\\_|                   (,~~  -Boni Yeamin"
    echo "                                   \\~\\  -Email: boniyeamin.cse@gmail.com   "
    echo "                                    ~~    "
    echo ""
}

# Function to update the OS
update_os() {
    if [ -f /etc/debian_version ]; then
        sudo apt update && sudo apt upgrade -y
    elif [ -f /etc/redhat-release ]; then
        sudo yum update -y
    elif [ -f /etc/arch-release ]; then
        sudo pacman -Syu --noconfirm
    else
        echo "Unsupported Linux distribution."
        exit 1
    fi
}

# Function to install Docker
install_docker() {
    if [ -f /etc/debian_version ]; then
        sudo apt update
        sudo apt install -y \
            ca-certificates \
            curl \
            gnupg \
            lsb-release

        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

        echo \
            "deb [arch=\$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
            \$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

        sudo apt update
        sudo apt install -y docker-ce docker-ce-cli containerd.io
    elif [ -f /etc/redhat-release ]; then
        sudo yum install -y yum-utils
        sudo yum-config-manager \
            --add-repo \
            https://download.docker.com/linux/centos/docker-ce.repo
        sudo yum install -y docker-ce docker-ce-cli containerd.io
        sudo systemctl start docker
        sudo systemctl enable docker
    elif [ -f /etc/arch-release ]; then
        sudo pacman -Syu --noconfirm
        sudo pacman -S --noconfirm docker
        sudo systemctl start docker
        sudo systemctl enable docker
    else
        echo "Unsupported Linux distribution."
        exit 1
    fi

    sudo usermod -aG docker $USER
    echo "Docker installed and user added to docker group. Please log out and log back in for the changes to take effect."
}

# Function to install common utilities
install_common_utilities() {
    if [ -f /etc/debian_version ]; then
        sudo apt update
        sudo apt install -y vim git curl wget htop
    elif [ -f /etc/redhat-release ]; then
        sudo yum install -y vim git curl wget htop
    elif [ -f /etc/arch-release ]; then
        sudo pacman -Syu --noconfirm
        sudo pacman -S --noconfirm vim git curl wget htop
    else
        echo "Unsupported Linux distribution."
        exit 1
    fi
}

# Menu function
show_menu() {
    echo "Select an option:"
    echo "1) Update OS"
    echo "2) Install Docker"
    echo "3) Install common utilities"
    echo "4) Exit"
    read -p "Enter your choice [1-4]: " choice
    case $choice in
        1) update_os ;;
        2) install_docker ;;
        3) install_common_utilities ;;
        4) exit 0 ;;
        *) echo "Invalid choice, please select an option between 1-4." ;;
    esac
}

# Display the banner and loop until the user chooses to exit
display_banner
while true; do
    show_menu
done
