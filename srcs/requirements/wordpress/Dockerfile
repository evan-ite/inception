# Use the latest stable version of Debian as the base image
FROM debian:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
	php8.2-fpm \
	php8.2-mysql \
	php-cli \
	curl \
	wget \
	unzip \
	&& apt-get clean

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV PATH="/usr/local/bin:/usr/sbin:${PATH}"

# Create the directory for WordPress
RUN mkdir -p /var/www/html

# Download and extract WordPress
RUN wget https://wordpress.org/latest.zip -O /tmp/wordpress.zip && \
	unzip /tmp/wordpress.zip -d /var/www/html && \
	rm /tmp/wordpress.zip

# Set permissions
RUN chown -R www-data:www-data /var/www/html/wordpress

# Copy custom php-fpm configuration
COPY conf/php-fpm.conf /etc/php/8.2/fpm/php-fpm.conf

# Copy wp-config.php
COPY conf/wp-config.php /var/www/html/wordpress/wp-config.php

# Change working directory
WORKDIR /var/www/html/wordpress

# Install phpdotenv
RUN composer require vlucas/phpdotenv

# Expose the PHP-FPM port
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm8.2", "-F"]
