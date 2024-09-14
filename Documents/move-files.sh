#!/bin/bash

# Define source and destination paths
SOURCE_FOLDER=$(pwd)/ProjectConfig
DESTINATION_FOLDER=/home/ProjectConfig

# Check if /home/ProjectConfig exists and delete it if it does
if [ -d "$DESTINATION_FOLDER" ]; then
    echo "Directory $DESTINATION_FOLDER exists. Removing it..."
    sudo rm -rf "$DESTINATION_FOLDER" || { echo "Failed to remove $DESTINATION_FOLDER"; exit 1; }
fi

# Create /home/ProjectConfig directory with permissions 777
echo "Creating directory $DESTINATION_FOLDER with permissions 777..."
sudo mkdir -p -m 777 "$DESTINATION_FOLDER" || { echo "Failed to create $DESTINATION_FOLDER"; exit 1; }

# Move all contents from the current directory's ProjectConfig to /home/ProjectConfig
if [ -d "$SOURCE_FOLDER" ]; then
    echo "Moving contents from $SOURCE_FOLDER to $DESTINATION_FOLDER"
    sudo mv "$SOURCE_FOLDER"/* "$DESTINATION_FOLDER" || { echo "Failed to move contents from $SOURCE_FOLDER"; exit 1; }
else
    echo "Source folder $SOURCE_FOLDER does not exist"
    exit 1
fi

# Create /opt/soft directory with permissions 777
echo "Creating directory /opt/soft with permissions 777..."
sudo mkdir -p -m 777 /opt/soft || { echo "Failed to create /opt/soft"; exit 1; }

# Move PyLaneV3App folder to /opt/soft/
SOURCE_FOLDER=$(pwd)/PyLaneV3App
DESTINATION_FOLDER=/opt/soft/

if [ -d "$SOURCE_FOLDER" ]; then
    echo "Moving folder from $SOURCE_FOLDER to $DESTINATION_FOLDER"
    sudo mv "$SOURCE_FOLDER" "$DESTINATION_FOLDER" || { echo "Failed to move folder $SOURCE_FOLDER"; exit 1; }
else
    echo "Source folder $SOURCE_FOLDER does not exist"
    exit 1
fi

# Move nopysy_v1.tar file to /opt/soft/
SOURCE_FOLDER=$(pwd)/nopysy_v1.tar
DESTINATION_FOLDER=/opt/soft/

if [ -f "$SOURCE_FOLDER" ]; then
    echo "Moving file from $SOURCE_FOLDER to $DESTINATION_FOLDER"
    sudo mv "$SOURCE_FOLDER" "$DESTINATION_FOLDER" || { echo "Failed to move file $SOURCE_FOLDER"; exit 1; }
else
    echo "Source file $SOURCE_FOLDER does not exist"
    exit 1
fi

echo "Directories created, files moved, and changed to /opt/soft/"
