# Use the latest stable version of Debian as the base image
FROM debian:latest

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server mariadb-client gettext

# Copy custom configuration files if you have any (optional)
# COPY conf/my.cnf /etc/mysql/my.cnf

# Set up environment variables
ENV MYSQL_DATABASE=wordpress_db

COPY conf/server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Expose the default MariaDB port
EXPOSE 3306

# Copy the SQL script and entry point script
COPY conf/init.sql /docker-entrypoint-initdb.d/init.sql
COPY conf/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Start the MariaDB service
CMD ["mysqld_safe"]
