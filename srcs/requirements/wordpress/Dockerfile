# base image
FROM debian:latest

RUN mkdir -p /var/www/wordpress

# update package manager
RUN apt-get update -y && apt-get upgrade -y

# install packages
RUN apt-get install -y wget php8.2-fpm php8.2-mysql mariadb-client curl netcat-traditional


# clean up cached package files
RUN rm -rf /var/lib/apt/lists/

# copy WordPress config script into container
COPY tools/wp_config.sh /usr/local/bin/wp_config.sh

# change executable rights of database creation script
RUN chmod +x /usr/local/bin/wp_config.sh

# define WordPress config script to run when container starts
ENTRYPOINT ["/usr/local/bin/wp_config.sh"]