# Use the latest stable version of Debian as the base image
FROM debian:latest

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server mariadb-client gettext

# Set up environment variables
ENV MYSQL_DATABASE=wordpress_db

# Copy config files and setup script
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/setup-db.sh /usr/local/bin/setup-db.sh
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/setup-db.sh /usr/local/bin/entrypoint.sh

# Expose the default MariaDB port
EXPOSE 3306

# Use a custom entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
