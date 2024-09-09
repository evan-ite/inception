# base image
FROM debian:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
	php8.2-fpm \
	php8.2-mysql \
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

# Download and extract WordPress
# RUN wget https://wordpress.org/latest.zip -O /tmp/wordpress.zip && \
# 	unzip /tmp/wordpress.zip -d /var/www/html && \
# 	rm /tmp/wordpress.zip

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
RUN chmod +x /usr/local/bin/setup-wp.sh \
	&& chmod +x /usr/local/bin/entrypoint.sh

# Change working directory
WORKDIR /var/www/html/wordpress

# Expose the PHP-FPM port
EXPOSE 9000

# Set the custom entrypoint
CMD ["/usr/local/bin/entrypoint.sh"]