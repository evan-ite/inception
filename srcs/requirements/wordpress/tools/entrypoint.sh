#!/bin/bash

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	echo "Running WordPress setup..."
	/usr/local/bin/setup-wp.sh
fi

exec php-fpm7.4 -F
