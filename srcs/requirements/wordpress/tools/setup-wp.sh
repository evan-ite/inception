#!/bin/bash

# Check if WordPress is already installed
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then

	echo "script does not exist"

	# Download WordPress core files
    wp core download --path=/var/www/html/wordpress --allow-root

    wp config create \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASSWORD \
        --dbhost=$DB_HOST \
        --path=/var/www/html/wordpress \
        --allow-root
	
    wp core install \
        --url=$DOMAIN_NAME \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN \
        --admin_email=$WP_ADMIN_EMAIL \
        --admin_password=$WP_ADMIN_PASSWORD \
        --path=/var/www/html/wordpress \
        --allow-root

else    
	echo "script does exist"
    # Update site title
    wp option update blogname "$WP_TITLE" --path=/var/www/html/wordpress --allow-root

    # Update admin user info
    wp user update $WP_ADMIN \
        --user_pass=$WP_ADMIN_PASSWORD \
        --user_email=$WP_ADMIN_EMAIL \
        --path=/var/www/html/wordpress \
        --allow-root

fi

# Create additional user
wp user create $WP_USER $WP_USER_EMAIL \
    --user_pass=$WP_USER_PASSWORD \
    --role=editor \
    --path=/var/www/html/wordpress \
    --allow-root
