FROM centos:8

# Install required packages
RUN yum install centos-release-scl && \
    yum install mariadb-server mariadb 

# Expose port 80
EXPOSE 3306

# Copy entrypoint.sh script into the container
COPY database-tier/entrypoint.sh /entrypoint.sh

# Grant execute permission to the entrypoint script
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Note: make sure to pass environment variable MYSQL_ROOT_PASSWORD during execution on this image