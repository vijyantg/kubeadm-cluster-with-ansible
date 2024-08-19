#!/bin/bash

set -x 
set -e
# Function to update the hosts.ini file
update_hosts_ini() {
    local username="$1"
    local master_ip="$2"
    local worker_ip="$3"
    local storage_ip="$4"
    local hosts_file="inventory/hosts.ini"

    # Validate if the hosts.ini file exists
    if [[ ! -f "$hosts_file" ]]; then
        echo "Error: $hosts_file not found!"
        exit 1
    fi

    # Update the ansible_user, master IP, worker IP, and storage IP
    sed -i "s/^ansible_user=.*/ansible_user=$username/" $hosts_file
    sed -i "s/^master ansible_host=.*/master ansible_host=$master_ip/" $hosts_file
    sed -i "s/^worker-1 ansible_host=.*/worker-1 ansible_host=$worker_ip/" $hosts_file
    sed -i "s/^nfs-servers-1 ansible_host=.*/nfs-servers-1 ansible_host=$storage_ip/" $hosts_file

    echo "hosts.ini has been updated successfully."
}

# Main script
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <username> <master_ip> <worker_ip> <storage_ip>"
    exit 1
fi

update_hosts_ini "$1" "$2" "$3" "$4"
