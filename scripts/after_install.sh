#!/usr/bin/env bash

# Navigate to the Laravel application directory
cd /var/www/task-manager

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
