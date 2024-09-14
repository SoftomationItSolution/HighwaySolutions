#!/bin/bash

# Stop MySQL service
echo "Stopping MySQL service..."
sudo systemctl stop mysql

# Remove MySQL packages
echo "Removing MySQL packages..."
sudo apt-get remove --purge -y mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-*

# Remove unnecessary packages
echo "Removing unnecessary packages..."
sudo apt-get autoremove -y

# Remove MySQL configuration and database files
echo "Removing MySQL configuration and database files..."
sudo rm -rf /etc/mysql
sudo rm -rf /var/lib/mysql

# Remove MySQL user and group
echo "Removing MySQL user and group..."
sudo deluser mysql
sudo delgroup mysql

# Clean up residual files
echo "Cleaning up residual files..."
sudo rm -rf /var/log/mysql*
sudo rm -rf /var/log/mysql

# Update package database
echo "Updating package database..."
sudo apt-get update

echo "MySQL has been completely removed from your system."
