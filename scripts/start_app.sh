#!/usr/bin/bash 

sed -i 's/\[]/\["52.2.207.0"]/' /home/ubuntu/task-manager

php artisan config:clear
php artisan migrate --force --seed
php artisan clear-compiled
php artisan auth:clear-resets
php artisan optimize:clear
php artisan config:cache
php artisan view:cache
php artisan route:clear
composer dump-autoload
sudo service nginx restart

