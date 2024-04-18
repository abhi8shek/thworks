FROM ghcr.io/oracle/oraclelinux8-php:7.4-apache-20240417

# Install necessary packages
RUN dnf  install php-intl && \
    dnf install wget && \
    dnf install openssl 

# Expose port 80
EXPOSE 80
EXPOSE 443

# Copy entrypoint.sh script into the container
COPY web-tier/entrypoint.sh /entrypoint.sh

# Grant execute permission to the entrypoint script
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
