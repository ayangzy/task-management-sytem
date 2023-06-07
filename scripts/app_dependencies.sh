#!/usr/bin/bash

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" 

sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

sudo chmod +x /usr/local/bin/composer

cp .env.example .env

composer install --optimize-autoloader