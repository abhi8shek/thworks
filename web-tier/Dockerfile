# Use the official Oracle Linux 8 image as the base image
FROM oraclelinux:8

# Enable PHP 7.4 module and install necessary packages
RUN dnf module reset php && \
    dnf module enable php:7.4 && \
    dnf install -y httpd php php-mysqlnd php-gd php-xml  php-mbstring php-json mod_ssl php-intl php-apcu && \
    dnf install -y firewalld && \
    systemctl enable firewalld

# Expose port 80
EXPOSE 80

# Start Apache service
CMD ["/bin/bash", "-c", "exec /usr/sbin/httpd -DFOREGROUND && systemctl restart httpd"]
