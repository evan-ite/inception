#!/bin/bash

# Check if the setup has already been done
if [ -f /var/lib/mysql/.db_setup_done ]; then
	echo "Database setup already done."
else
	echo "Running MariaDB setup..."

	# Start MariaDB service
	service mariadb start

	# Wait for MariaDB to be ready
	until mysqladmin ping -h "localhost" --silent; do
		echo "Waiting for MariaDB to be ready..."
		sleep 2
	done

	echo "MariaDB is ready."

	# Run the setup script
	/usr/local/bin/setup-db.sh

	# Create a flag file to indicate setup is done
	touch /var/lib/mysql/.db_setup_done
fi

# Start MariaDB
exec mysqld_safe
