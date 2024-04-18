#!/bin/bash

# Start and Enable MariaDB
systemctl start mariadb
systemctl enable mariadb

# Secure MariaDB installation
mysql_secure_installation <<EOF
y
${ MYSQL_ROOT_PASSWORD }
${ MYSQL_ROOT_PASSWORD }
y
y
y
y
EOF

# Log into MySQL client
mysql -u root -p '${MYSQL_ROOT_PASSWORD }' <<EOF
CREATE USER 'wiki'@'localhost' IDENTIFIED BY '${ MYSQL_ROOT_PASSWORD }';
CREATE DATABASE wikidatabase;
GRANT ALL PRIVILEGES ON wikidatabase.* TO 'wiki'@'localhost';
FLUSH PRIVILEGES;
SHOW DATABASES;
SHOW GRANTS FOR 'wiki'@'localhost';
exit
EOF
