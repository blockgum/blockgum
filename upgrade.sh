#!/bin/bash

# Introduction and check if Blockgum is installed
echo "Checking if Blockgum is installed..."

if [ ! -d "/home/blockgum" ]; then
    echo "Blockgum is not currently installed. Please check the installation."
    exit 1
fi

echo "Blockgum installation found."

# Confirmation prompt
echo "This script will upgrade the Blockgum software."
echo "It will perform the following actions:"
echo "1. Stop the blockgum service."
echo "2. Download the latest Blockgum release."
echo "3. Replace the old binaries with the new ones."
echo "4. Restart the blockgum service."
read -p "Do you want to continue? (yes/no) " response

# Check user input
if [[ "$response" != "yes" ]]; then
    echo "Upgrade cancelled."
    exit 1
fi

# Proceed with the upgrade if the user agrees
echo "Starting the upgrade process..."

# Stop the blockgum service
echo "Stopping blockgum service..."
systemctl stop blockgum

# Create the upgrade directory if it doesn't exist
echo "Creating /opt/bg_upgrade directory..."
mkdir -p /opt/bg_upgrade

# Change to the upgrade directory
cd /opt/bg_upgrade || exit

# Download the latest Blockgum release
echo "Downloading the latest Blockgum release..."
download_url=$(curl -s https://api.github.com/repos/blockgum/blockgum/releases/latest | grep "browser_download_url.*zip" | cut -d '"' -f 4)
wget -q "$download_url" -O bg_latest.zip

# Unzip the downloaded file
echo "Unzipping the downloaded file..."
unzip -o bg_latest.zip

# Assuming the unzipped binaries are in the current directory, move them to the target directory
echo "Updating Blockgum binaries..."
mv bg_mongo_linux bg_wallet_linux bg_utils_linux /home/blockgum/

# Change to the target directory where the binaries are located
cd /home/blockgum || exit

# Make the binaries executable
echo "Making the binaries executable..."
chmod +x bg_mongo_linux bg_wallet_linux bg_utils_linux

# Restart the blockgum service
echo "Restarting blockgum service..."
systemctl restart blockgum

echo "Blockgum upgrade completed successfully."
