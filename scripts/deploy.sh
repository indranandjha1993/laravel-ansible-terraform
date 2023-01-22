#!/bin/bash

# Set some variables
APP_NAME="myapp"
APP_ENV="prod"
APP_DIR="/var/www/$APP_NAME"
GIT_REMOTE="origin"
GIT_BRANCH="master"

# Change to the application directory
cd $APP_DIR

# Pull the latest code from the git repository
git pull $GIT_REMOTE $GIT_BRANCH

# Install dependencies
composer install --no-dev --optimize-autoloader

# Run database migrations
php artisan migrate --env=$APP_ENV

# Clear the cache
php artisan cache:clear

# Restart the web server
sudo service nginx restart
