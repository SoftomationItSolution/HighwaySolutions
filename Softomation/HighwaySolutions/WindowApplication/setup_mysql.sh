#!/bin/bash

# Function to prompt for MySQL root password and new user details
prompt_user_details() {
    read -sp 'Enter MySQL root password: ' root_password
    echo
    read -p 'Enter new MySQL username: ' new_username
    read -sp 'Enter password for new MySQL user: ' new_user_password
    echo
}

# Update package list
sudo apt update &&

sudo apt purge mysql* &&

# Install MySQL server
sudo apt install -y mysql-server &&

# Start and enable MySQL service
sudo systemctl start mysql &&
sudo systemctl enable mysql &&

# Allow MySQL through firewall
sudo ufw allow mysql &&

# Configure MySQL to listen on all IP addresses
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf &&

# Restart MySQL service
sudo systemctl restart mysql &&


# Prompt for MySQL root password and new user details
prompt_user_details

# Create MySQL user and grant privileges
mysql -u root -p"$root_password" <<EOF
SELECT User, Host FROM mysql.user WHERE User = '$new_username' AND Host = '%';
DROP USER IF EXISTS '$new_username'@'%';
CREATE USER '$new_username'@'%' IDENTIFIED BY '$new_user_password';
GRANT ALL PRIVILEGES ON *.* TO '$new_username'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Display MySQL configuration
cat /etc/mysql/mysql.conf.d/mysqld.cnf &&


echo "MySQL setup is complete."
