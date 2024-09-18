#!/bin/bash

echo "Start WordPress database setup."

DB_ROOT_PW=$(cat /run/secrets/db_root_pw)
DB_PW=$(cat /run/secrets/db_pw)

mysql -u root -p"${DB_ROOT_PW}" -e "
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PW}' WITH GRANT OPTION;
FLUSH PRIVILEGES;"

if [ $? -eq 0 ]; then
	echo "Privileges granted successfully and database created."
else
	echo "Failed to grant privileges or create database."
fi

