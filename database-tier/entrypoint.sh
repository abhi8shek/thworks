#!/bin/bash

# Start MariaDB
/usr/bin/mysqld_safe --skip-networking &

# Wait for MariaDB to start
while ! mysqladmin ping -hlocalhost --silent; do
    sleep 1
done

# Secure MariaDB installation
mysql_secure_installation <<EOF
y
${MYSQL_ROOT_PASSWORD}
${MYSQL_ROOT_PASSWORD}
y
y
y
y
EOF

# Log into MySQL client and set up the database
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<EOF
CREATE USER 'wiki'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE wikidatabase;
GRANT ALL PRIVILEGES ON wikidatabase.* TO 'wiki'@'localhost';
FLUSH PRIVILEGES;
SHOW DATABASES;
SHOW GRANTS FOR 'wiki'@'localhost';
exit
EOF
