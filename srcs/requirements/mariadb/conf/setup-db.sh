#!/bin/bash

# Check if variables are set
if [ -z "$DB_USER" ] || [ -z "$MYSQL_ROOT_PASSWORD" ] || [ -z "$DB_PASSWORD" ] || [ -z "$DB_NAME" ]; then
    echo "One or more environment variables are missing in the .env file."
    exit 1
fi

# Create Database for WordPress
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"

# Connect to MariaDB and grant privileges
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;
FLUSH PRIVILEGES;"

# Check if the privileges were granted successfully
if [ $? -eq 0 ]; then
    echo "Privileges granted successfully to ${MYSQL_USER}."
else
    echo "Failed to grant privileges."
fi
