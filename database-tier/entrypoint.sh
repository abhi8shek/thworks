# Log into MySQL client and set up the database
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" <<EOF
CREATE USER 'wiki'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
CREATE DATABASE wikidatabase;
GRANT ALL PRIVILEGES ON wikidatabase.* TO 'wiki'@'localhost';
FLUSH PRIVILEGES;
SHOW DATABASES;
SHOW GRANTS FOR 'wiki'@'localhost';
exit
EOF