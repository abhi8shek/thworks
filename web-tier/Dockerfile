# Use the official Oracle Linux 8 image as the base image
FROM oraclelinux:8

# Enable PHP 7.4 module and install necessary packages
RUN dnf module reset php && \
    dnf module enable php:7.4 && \
    dnf install wget && \
    dnf install openssl && \
    dnf install -y httpd php php-mysqlnd php-gd php-xml  php-mbstring php-json mod_ssl php-intl php-apcu && \
    dnf install -y firewalld && \
    systemctl enable firewalld

# Expose port 80
EXPOSE 80

# Copy entrypoint.sh script into the container
COPY web-tier/entrypoint.sh /entrypoint.sh

# Grant execute permission to the entrypoint script
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
