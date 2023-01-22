#!/bin/bash

# Set some variables
APP_NAME="myapp"
APP_ENV="prod"
BACKUP_DIR="/var/backups/$APP_NAME"

# Change to the backup directory
cd $BACKUP_DIR

# Prompt for the backup file to restore
read -p "Enter the backup file to restore (e.g. myapp_prod_2022-01-01.sql): " backup_file

# Check if the backup file exists
if [ ! -f $backup_file ]; then
    echo "Error: Backup file not found"
    exit 1
fi

# Restore the database
mysql -u root -p${MYSQL_ROOT_PASSWORD} < $backup_file

# Extract the application files
tar -xf ${backup_file%.*}.tar.gz -C /var/www
