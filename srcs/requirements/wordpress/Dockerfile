# base image
FROM debian:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
	php8.2-fpm \
    php8.2-mysql \
    php8.2-gd \
    php8.2-curl \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-zip \
    php8.2-soap \
    php8.2-intl \
    php8.2-bcmath \
    php8.2-cgi\
    php8.2-opcache \
	curl \
	wget \
	unzip \
	mariadb-client \
	net-tools \
	netcat-openbsd \
	&& apt-get clean

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
COPY conf/php-fpm.conf /etc/php/8.2/fpm/php-fpm.conf

# Copy www.conf
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

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
