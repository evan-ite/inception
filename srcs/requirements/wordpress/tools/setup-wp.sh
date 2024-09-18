#!/bin/bash

DB_PW=$(cat /run/secrets/db_pw)
WP_ADMIN_PW=$(cat /run/secrets/wp_admin_pw)
WP_USER_PW=$(cat /run/secrets/wp_user_pw)


function wait_for_mariadb() {
	until mysql -h"$DB_HOST" -u"$DB_USER" -p"$DB_PW" -e "SELECT 1" &> /dev/null; do
		echo "Waiting for MariaDB to be ready..."
		sleep 3
	done
	echo "MariaDB is ready."

	until mysql -h"$DB_HOST" -u"$DB_USER" -p"$DB_PW" -e "USE $DB_NAME; SELECT 1" &> /dev/null; do
		echo "Waiting for database $DB_NAME to be created..."
		sleep 3
	done
	echo "Database $DB_NAME is created and accessible."
}

wait_for_mariadb

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then

	echo "wp-config.php not found, installing WordPress..."

	wp core download --path=/var/www/html/wordpress --allow-root

	wp config create \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PW \
		--dbhost=$DB_HOST \
		--path=/var/www/html/wordpress \
		--allow-root

	wp core install \
		--url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_email=$WP_ADMIN_EMAIL \
		--admin_password=$WP_ADMIN_PW \
		--path=/var/www/html/wordpress \
		--allow-root

else
	echo "wp-config.php exists, updating WordPress."

	wp option update blogname "$WP_TITLE" --path=/var/www/html/wordpress --allow-root

	wp user update $WP_ADMIN \
		--user_pass=$WP_ADMIN_PW \
		--user_email=$WP_ADMIN_EMAIL \
		--path=/var/www/html/wordpress \
		--allow-root

fi


wp user create $WP_USER $WP_USER_EMAIL \
	--user_pass=$WP_USER_PW \
	--role=editor \
	--path=/var/www/html/wordpress \
	--allow-root

mkdir -p /var/www/html/wordpress/wp-content/uploads
chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads
chmod -R 755 /var/www/html/wordpress/wp-content/uploads
