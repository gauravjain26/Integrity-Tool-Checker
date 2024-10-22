#!/bin/bash

# Simple File Integrity Checker

# Function to check file integrity
check_file_integrity() {
    read -p "Enter the filename to check integrity: " filename
    if [ -f "$filename" ]; then
        read -p "Enter the checksum file (e.g., checksums.txt): " checksum_file
        sha256sum -c "$checksum_file" --ignore-missing
    else
        echo "File not found!"
    fi
}

# Function to generate file hashes
generate_file_hash() {
    read -p "Enter the filename to generate hash: " filename
    if [ -f "$filename" ]; then
        sha256sum "$filename" >> checksums.txt
        echo "Hash saved to checksums.txt for $filename"
    else
        echo "File not found!"
    fi
}

# Function to display the menu
show_menu() {
    echo "-----------------------------"
    echo "     File Integrity Checker   "
    echo "-----------------------------"
    echo "1. Generate File Hash"
    echo "2. Check File Integrity"
    echo "3. Exit"
    echo "-----------------------------"
    read -p "Choose an option: " choice
}

# Main loop
while true; do
    show_menu
    case $choice in
        1) generate_file_hash ;;
        2) check_file_integrity ;;
        3) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option, please try again!" ;;
    esac
    echo ""
done