#!/bin/bash

if [ -f /var/lib/mysql/.db_setup_done ]; then
	echo "Database setup already done."
else
	echo "Running MariaDB setup..."

	service mariadb start

	until mysqladmin ping -h "localhost" --silent; do
		echo "Waiting for MariaDB to be ready..."
		sleep 2
	done

	echo "MariaDB is ready."

	/usr/local/bin/setup-db.sh

	touch /var/lib/mysql/.db_setup_done
fi

exec mysqld_safe
