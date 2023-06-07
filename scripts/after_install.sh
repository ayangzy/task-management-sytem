#!/usr/bin/env bash

# Navigate to the Laravel application directory
cd /home/ubuntu/var/www/task-manager

# Update system packages
sudo apt update

# Install PHP dependencies
sudo apt install -y \
    php8.0-common \
    php8.0-mysql \
    php8.0-xml \
    php8.0-xmlrpc \
    php8.0-curl \
    php8.0-gd \
    php8.0-imagick \
    php8.0-cli \
    php8.0-dev \
    php8.0-imap \
    php8.0-mbstring \
    php8.0-opcache \
    php8.0-soap \
    php8.0-zip \
    php8.0-intl \
    php8.0-fpm

# Install Nginx
sudo apt install -y nginx

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on system boot
sudo systemctl enable nginx

# Install Composer
EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE="$(php -r "echo hash_file('SHA384', 'composer-setup.php');")"

if [[ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]]; then
    >&2 echo 'ERROR: Invalid composer installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Remove composer-setup.php
rm composer-setup.php

# Verify Composer installation
composer --version

# Install Composer dependencies
composer install --optimize-autoloader --no-dev

# Generate application key
php artisan key:generate

# Run database migrations and seeders
php artisan migrate --force
php artisan db:seed --force

# Set appropriate permissions for the storage and bootstrap/cache directories
sudo chown -R www-data:www-data storage bootstrap/cache
sudo chmod -R 775 storage bootstrap/cache

# Generate optimized class loader
php artisan optimize
