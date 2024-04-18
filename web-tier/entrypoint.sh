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

# Extract MediaWiki tarball
cd /var/www
wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.1.tar.gz
tar -zxf mediawiki-1.41.1.tar.gz
ln -s mediawiki-1.41.1/ mediawiki

# Change ownership of MediaWiki directory
chown -R apache:apache /var/www/mediawiki-1.41.1
chmod 775 /var/www/mediawiki-1.41.1
chmod -R 644 /var/www/mediawiki-1.41.1/

# Set SELinux context for MediaWiki directories
restorecon -FR /var/www/mediawiki-1.41.1/
restorecon -FR /var/www/mediawiki

# start apache server
/usr/sbin/httpd -k start -DFOREGROUND
