# Use the official Oracle Linux 8 image as the base image
FROM oraclelinux:8

# Install required packages
RUN dnf install -y mariadb-server mariadb && \
    dnf clean all

# Expose port 80
EXPOSE 3306

# Copy entrypoint.sh script into the container
COPY ${pwd}/entrypoint.sh /entrypoint.sh

# Grant execute permission to the entrypoint script
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Note: make sure to pass environment variable MYSQL_ROOT_PASSWORD during execution on this image