#!/bin/bash

# Enable Apache
systemctl enable httpd

# Download MediaWiki tarball and GPG signature
cd /home/$(whoami)
wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.1.tar.gz
wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.1.tar.gz.sig

# Verify the tarball's integrity
gpg --verify mediawiki-1.41.1.tar.gz.sig mediawiki-1.41.1.tar.gz

# Extract MediaWiki tarball
cd /var/www
tar -zxf /home/$(whoami)/mediawiki-1.41.1.tar.gz
ln -s mediawiki-1.41.1/ mediawiki

# Configure Apache
sed -i 's|DocumentRoot "/var/www"|DocumentRoot "/var/www/mediawiki"|g' /etc/httpd/conf/httpd.conf
sed -i '/<Directory "\/var\/www">/!b;n;c\DirectoryIndex index.html index.html.var index.php' /etc/httpd/conf/httpd.conf

# Change ownership of MediaWiki directory
chown -R apache:apache /var/www/mediawiki-1.41.1

# Set SELinux context for MediaWiki directories
restorecon -FR /var/www/mediawiki-1.41.1/
restorecon -FR /var/www/mediawiki

# Configure firewall for HTTP and HTTPS
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
systemctl restart firewalld
systemctl restart httpd