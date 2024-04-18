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

wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.1.tar.gz

# Extract MediaWiki tarball
cd /var/www
tar -zxf /root/mediawiki-1.41.1.tar.gz
ln -s mediawiki-1.41.1/ mediawiki

HTTPD_CONF="/etc/httpd/conf/httpd.conf"
SSL_CERTIFICATE="/etc/pki/tls/certs/localhost.crt"
SSL_PRIVATE_KEY="/etc/pki/tls/private/localhost.key"

sed -i 's|/var/www/html|/var/www/html/mediawiki|g' $HTTPD_CONF
# Listen on Port 443 Only
sed -i 's|^Listen [0-9]*$|Listen 443|' $HTTPD_CONF
sed -i '/^Listen [0-9]*$/d' $HTTPD_CONF

# Disable Default Directory
sed -i '/<Directory "\/var\/www\/html">/,/<\/Directory>/d' $HTTPD_CONF



# Change ownership of MediaWiki directory
chown -R apache:apache /var/www/mediawiki-1.41.1

# Set SELinux context for MediaWiki directories
restorecon -FR /var/www/mediawiki-1.41.1/
restorecon -FR /var/www/mediawiki

# start apache server
/usr/sbin/httpd -k start
exec "$@"
