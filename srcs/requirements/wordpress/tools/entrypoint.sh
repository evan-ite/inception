#!/bin/bash

# Run the setup script
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	echo "Running WordPress setup..."
	/usr/local/bin/setup-wp.sh
fi

# Start PHP-FPM
exec php-fpm7.4 -F
