FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	php7.4-fpm php7.4-mysql php7.4-gd \
	php7.4-curl php7.4-mbstring php7.4-xml \
	php7.4-zip php7.4-soap php7.4-intl \
	php7.4-bcmath php7.4-cgi php7.4-opcache \
	curl unzip mariadb-client \
	net-tools netcat-openbsd && apt-get clean

ENV PATH="/usr/local/bin:/usr/sbin:${PATH}"

RUN mkdir -p /var/www/html/wordpress

RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R u+rwx /var/www/html/wordpress

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/setup-wp.sh /usr/local/bin/setup-wp.sh
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/setup-wp.sh /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html/wordpress

EXPOSE 9000

CMD ["/usr/local/bin/entrypoint.sh"]
