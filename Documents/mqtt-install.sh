#!/bin/bash

# Define configuration file path
CONFIG_FILE="/etc/mosquitto/mosquitto.conf"
BACKUP_FILE="/etc/mosquitto/mosquitto.conf.bak"

echo "Updating package list..."
sudo apt update

echo "Installing Mosquitto and Mosquitto clients..."
sudo apt install -y mosquitto mosquitto-clients

echo "Upgrading Mosquitto to the latest version..."
sudo apt upgrade -y mosquitto

# Create a backup of the original configuration file
echo "Creating backup of the original configuration file..."
sudo cp $CONFIG_FILE $BACKUP_FILE

# Append the new listener configurations
echo "Updating Mosquitto configuration..."
sudo bash -c 'echo -e "\n# MQTT listeners\nlistener 1883\nlistener 9001\nprotocol websockets" >> /etc/mosquitto/mosquitto.conf'

# Restart Mosquitto service to apply changes
echo "Restarting Mosquitto service..."
sudo systemctl restart mosquitto

# Check status of the Mosquitto service
echo "Checking Mosquitto service status..."
sudo systemctl status mosquitto
