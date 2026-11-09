#!/bin/bash
set -e

echo "Updating Amazon Linux..."
sudo dnf update -y

echo "Installing LAMP packages..."
sudo dnf install -y httpd mariadb105-server php php-mysqli

echo "Starting Apache..."
sudo systemctl enable --now httpd

echo "Starting MariaDB..."
sudo systemctl enable --now mariadb

echo "LAMP installation completed."