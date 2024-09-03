# Use the latest stable version of Debian as the base image
FROM debian:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
	php7.4-fpm \
	php7.4-mysql \
	wget \
	unzip \
	&& apt-get clean

ENV WORDPRESS_DB_HOST=mariadb-container:3306 \
	# PATH="/usr/sbin:${PATH}"
	PATH="/usr/sbin/php-fpm7.4:${PATH}"

# Create the directory for WordPress
RUN mkdir -p /var/www/html

# Download and extract WordPress
RUN wget https://wordpress.org/latest.zip -O /tmp/wordpress.zip && \
	unzip /tmp/wordpress.zip -d /var/www/html && \
	rm /tmp/wordpress.zip

# Set permissions
RUN chown -R www-data:www-data /var/www/html/wordpress

# Expose the PHP-FPM port
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7.4", "-F"]
