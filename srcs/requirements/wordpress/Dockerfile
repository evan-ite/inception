# base image
FROM debian:bullseye

# Install necessary packages
RUN apt-get update && apt-get install -y \
	php7.4-fpm php7.4-mysql php7.4-gd \
	php7.4-curl php7.4-mbstring php7.4-xml \
	php7.4-zip php7.4-soap php7.4-intl \
	php7.4-bcmath php7.4-cgi php7.4-opcache \
	curl unzip mariadb-client \
	net-tools netcat-openbsd && apt-get clean

ENV PATH="/usr/local/bin:/usr/sbin:${PATH}"

# Create the directory for WordPress
RUN mkdir -p /var/www/html/wordpress

# Set permissions
RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R u+rwx /var/www/html/wordpress

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Copy custom php-fpm configuration
COPY conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

# Copy www.conf
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Copy setup script and custom entrypoint script
COPY tools/setup-wp.sh /usr/local/bin/setup-wp.sh
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the scripts executable
RUN chmod +x /usr/local/bin/setup-wp.sh /usr/local/bin/entrypoint.sh

# Change working directory
WORKDIR /var/www/html/wordpress

# Expose the PHP-FPM port
EXPOSE 9000

# Set the custom entrypoint
CMD ["/usr/local/bin/entrypoint.sh"]
