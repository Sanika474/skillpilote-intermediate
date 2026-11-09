#!/bin/bash

echo "Apache Status:"
systemctl is-active httpd

echo "MariaDB Status:"
systemctl is-active mariadb

echo "PHP Version:"
php -v

echo "Apache Version:"
httpd -v

echo "MariaDB Version:"
mysql --version

echo "Local HTTP Test:"
curl -I http://localhost