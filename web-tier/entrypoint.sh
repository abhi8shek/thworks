#!/bin/bash

# self signed ssl certificate 
# Generate a self-signed SSL certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/pki/tls/private/localhost.key \
    -out /etc/pki/tls/certs/localhost.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=IT Department/CN=localhost"

# Update SSL configuration file
cat <<EOF > /etc/httpd/conf.d/ssl.conf
LoadModule ssl_module modules/mod_ssl.so

Listen 443 https

<VirtualHost _default_:443>
    DocumentRoot "/var/www/html"
    ServerName localhost:443
    SSLEngine on
    SSLCertificateFile "/etc/pki/tls/certs/localhost.crt"
    SSLCertificateKeyFile "/etc/pki/tls/private/localhost.key"
</VirtualHost>
EOF

# Start Apache
/usr/sbin/httpd -k start

# Make Apache start on boot
echo '/usr/sbin/httpd -k start' >> /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local

# Download MediaWiki tarball and GPG signature
cd /$(whoami)

wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.1.tar.gz
wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.1.tar.gz.sig


# Extract MediaWiki tarball
cd /var/www
tar -zxf /$(whoami)/mediawiki-1.41.1.tar.gz
ln -s mediawiki-1.41.1/ mediawiki

# Configure Apache
sed -i 's|DocumentRoot "/var/www"|DocumentRoot "/var/www/mediawiki"|g' /etc/httpd/conf/httpd.conf
sed -i '/<Directory "\/var\/www">/!b;n;c\DirectoryIndex index.html index.html.var index.php' /etc/httpd/conf/httpd.conf

# Change ownership of MediaWiki directory
chown -R apache:apache /var/www/mediawiki-1.41.1

# Set SELinux context for MediaWiki directories
restorecon -FR /var/www/mediawiki-1.41.1/
restorecon -FR /var/www/mediawiki
