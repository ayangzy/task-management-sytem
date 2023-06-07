#!/usr/bin/bash

sudo systemctl daemon-reload
sudo rm -f /etc/nginx/sites-enabled/default

sudo cp /home/ubuntu/task-manager/nginx/nginx.conf /etc/nginx/sites-available/task-manager
sudo rm -f /etc/nginx/sites-enabled/task-manager  # Remove existing link
sudo ln -s /etc/nginx/sites-available/task-manager /etc/nginx/sites-enabled/
sudo chown -R www-data:www-data storage/
sudo chown -R www-data:www-data bootstrap/cache/
sudo gpasswd -a www-data ubuntu
sudo systemctl restart nginx
