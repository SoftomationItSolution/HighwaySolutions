#!/bin/bash

# Variables
ANGULAR_PROJECT_PATH="/opt/soft/PyLaneV3App"
NGINX_CONF_PATH="/etc/nginx/sites-available/pylaneapp"
NGINX_CONF_ENABLED="/etc/nginx/sites-enabled/pylaneapp"

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Update package list and install Nginx
echo "Updating package list..."
apt update

echo "Installing Nginx..."
apt install -y nginx

# Start and enable Nginx
echo "Starting and enabling Nginx..."
systemctl start nginx
systemctl enable nginx

# Build Angular application
echo "Navigating to Angular project directory..."
cd "$ANGULAR_PROJECT_PATH" || { echo "Directory $ANGULAR_PROJECT_PATH not found"; exit 1; }

echo "Building Angular application..."
ng build --prod

# Create Nginx configuration file
echo "Creating Nginx configuration file..."
cat <<EOL > "$NGINX_CONF_PATH"
server {
    listen 127.0.0.1:8080;
    server_name 127.0.0.1;
    root /opt/soft/PyLaneV3App;
    index index.html;
    # Add MIME types
    include /etc/nginx/mime.types;
    types {
        application/manifest+json webmanifest;
    }
    location / {
        try_files $uri $uri/ /index.html;
    }
    
    location = /favicon.ico {
        alias /opt/soft/PyLaneV3App/favicon.ico;
    }
    
    # Serve .webmanifest files
    location ~* \.webmanifest$ {
        default_type application/manifest+json;
    }
}

EOL

# Enable the Nginx configuration
echo "Enabling Nginx configuration..."
ln -s "$NGINX_CONF_PATH" "$NGINX_CONF_ENABLED"

# Test Nginx configuration
echo "Testing Nginx configuration..."
nginx -t

if [ $? -ne 0 ]; then
    echo "Nginx configuration test failed. Please check the configuration file."
    exit 1
fi

# Restart Nginx to apply changes
echo "Restarting Nginx..."
systemctl restart nginx

# Adjust firewall settings (if UFW is used)
echo "Adjusting firewall settings..."
ufw allow 'Nginx Full'

echo "TMS lane application is now hosted on Nginx!"
