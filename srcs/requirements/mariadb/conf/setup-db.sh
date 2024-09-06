#!/bin/bash

# Check if variables are set
if [ -z "$DB_USER" ] || [ -z "$MYSQL_ROOT_PASSWORD" ] || [ -z "$MYSQL_PASSWORD" ]; then
    echo "One or more environment variables are missing in the .env file."
    exit 1
fi

# Connect to MariaDB and grant privileges
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;
FLUSH PRIVILEGES;"

# Check if the privileges were granted successfully
if [ $? -eq 0 ]; then
    echo "Privileges granted successfully to ${DB_USER} for ${WP_CONTAINER_NAME}."
else
    echo "Failed to grant privileges."
fi
