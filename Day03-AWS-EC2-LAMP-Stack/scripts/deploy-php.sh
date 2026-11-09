#!/bin/bash
set -e

if [ ! -f php/index.php ]; then
    echo "Error: php/index.php not found."
    exit 1
fi

sudo install -o root -g root -m 644 \
    php/index.php /var/www/html/index.php

sudo systemctl restart httpd

echo "PHP application deployed successfully."