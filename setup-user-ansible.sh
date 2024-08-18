#!/bin/bash

# Function to create a new user and add to the sudoers group
create_user() {
    local username="$1"

    # Create the user
    sudo adduser "$username"

    # Add the user to the sudo group
    sudo usermod -aG sudo "$username"

    echo "User $username created and added to sudoers group."
}

# Function to install Ansible
install_ansible() {
    sudo apt-get update
    sudo apt-get install -y ansible

    echo "Ansible has been installed successfully."
}

# Check if the script received the correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

# Create the user and install Ansible
create_user "$1"
install_ansible
