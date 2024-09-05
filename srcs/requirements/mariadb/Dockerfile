# Use the latest stable version of Debian as the base image
FROM debian:latest

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server mariadb-client gettext

# Set up environment variables
ENV MYSQL_DATABASE=wordpress_db

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Expose the default MariaDB port
EXPOSE 3306

# Start the MariaDB service
CMD ["mysqld_safe"]