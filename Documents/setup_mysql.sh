#!/bin/bash

# Update and install MySQL server
sudo apt update
sudo apt install -y mysql-server

# Start and enable MySQL service
sudo systemctl start mysql
sudo systemctl enable mysql

# Allow MySQL through firewall
sudo ufw allow mysql

# Configure MySQL to listen on all IP addresses
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL service
sudo systemctl restart mysql

# Display MySQL configuration
cat /etc/mysql/mysql.conf.d/mysqld.cnf

# Create MySQL user and grant privileges
sudo mysql -u root -p <<EOF
SELECT User, Host FROM mysql.user;
CREATE USER 'softo_db'@'%' IDENTIFIED BY 'Softo@7890';
GRANT ALL PRIVILEGES ON *.* TO 'softo_db'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

echo "MySQL setup is complete."