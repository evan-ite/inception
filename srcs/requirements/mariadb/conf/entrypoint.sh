#!/bin/bash
set -e

# Replace placeholders in the SQL script with environment variable values
envsubst < /docker-entrypoint-initdb.d/init.sql > /docker-entrypoint-initdb.d/init-final.sql

# Execute the final SQL script
mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" < /docker-entrypoint-initdb.d/init-final.sql

# Start the MariaDB server
exec "$@"