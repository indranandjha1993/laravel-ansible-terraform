#!/bin/bash

# Set some variables
APP_NAME="myapp"
APP_ENV="prod"
BACKUP_DIR="/var/backups/$APP_NAME"
DATE=$(date +%Y-%m-%d)

# Create the backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Dump the database to a SQL file
mysqldump -u root -p${MYSQL_ROOT_PASSWORD} ${APP_NAME}_${APP_ENV} > ${BACKUP_DIR}/${APP_NAME}_${APP_ENV}_${DATE}.sql

# Tar and compress the application directory
tar -zcf ${BACKUP_DIR}/${APP_NAME}_${APP_ENV}_${DATE}.tar.gz -C /var/www ${APP_NAME}

# Remove backups older than 7 days
find ${BACKUP_DIR} -name "*.sql" -type f -mtime +7 -delete
find ${BACKUP_DIR} -name "*.tar.gz" -type f -mtime +7 -delete
