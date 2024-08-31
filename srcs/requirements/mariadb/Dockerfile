# Use the penultimate stable version of Alpine as the base image
FROM alpine:3.18

# Install MariaDB
RUN apk update && apk add --no-cache mariadb mariadb-client mariadb-server-utils

# Copy custom configuration files if you have any (optional)
# COPY conf/my.cnf /etc/my.cnf

# Set up environment variables
ENV MYSQL_DATABASE=wordpress_db

# Initialize MariaDB
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Expose the default MariaDB port
EXPOSE 3306

# Copy a startup script if needed (optional)
# COPY tools/startup.sh /usr/local/bin/startup.sh
# RUN chmod +x /usr/local/bin/startup.sh

# Start the MariaDB service
CMD ["mysqld", "--user=mysql", "--console"]
