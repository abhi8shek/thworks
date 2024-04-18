FROM centos:8

# Enable PHP 7.4 module and install necessary packages
RUN yum install centos-release-scl && \
    yum install httpd24-httpd rh-php73 rh-php73-php rh-php73-php-mbstring rh-php73-php-mysqlnd rh-php73-php-gd rh-php73-php-xml

# Expose port 80
EXPOSE 80

# Copy entrypoint.sh script into the container
COPY web-tier/entrypoint.sh /entrypoint.sh

# Grant execute permission to the entrypoint script
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
