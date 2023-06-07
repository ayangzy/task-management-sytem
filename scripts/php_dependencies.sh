#!/usr/bin/env bash

sudo apt install software-properties-common ca-certificates lsb-release apt-transport-https -y

LC_ALL=C.UTF-8 sudo add-apt-repository ppa:ondrej/php 

sudo apt update

sudo apt install php8.0-common php8.0-mysql php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-intl php8.0-fpm -y

sudo apt purge apache2

