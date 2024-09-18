#!/bin/bash

echo "Start WordPress database setup."

DB_ROOT_PW=$(cat /run/secrets/db_root_pw)
DB_PW=$(cat /run/secrets/db_pw)

# Connect to MariaDB and grant privileges
mysql -u root -p"${DB_ROOT_PW}" -e "
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PW}' WITH GRANT OPTION;
FLUSH PRIVILEGES;"

# Check if the privileges were granted successfully
if [ $? -eq 0 ]; then
	echo "Privileges granted successfully and database created."
else
	echo "Failed to grant privileges or create database."
fi

