#!/bin/bash

echo "Start WordPress database setup."

# Connect to MariaDB and grant privileges
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}' WITH GRANT OPTION;
FLUSH PRIVILEGES;"

# Check if the privileges were granted successfully
if [ $? -eq 0 ]; then
	echo "Privileges granted successfully and database created."
else
	echo "Failed to grant privileges or create database."
fi

