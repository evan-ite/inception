# Use the latest stable version of Debian as the base image
FROM debian:latest

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

# Copy custom configuration files if you have any (optional)
# COPY conf/my.cnf /etc/mysql/my.cnf

# Set up environment variables
ENV MYSQL_DATABASE=wordpress_db

# Expose the default MariaDB port
EXPOSE 3306

# Copy a startup script if needed (optional)
# COPY tools/startup.sh /usr/local/bin/startup.sh
# RUN chmod +x /usr/local/bin/startup.sh

# Start the MariaDB service
CMD ["mysqld_safe"]
