# base image
FROM debian:bullseye

# update package manager
RUN apt-get update -y && apt-get upgrade -y

# install nginx and openssl
RUN apt-get install -y nginx openssl

# clean up cached package files
RUN rm -rf /var/lib/apt/lists/*

# copy custom NGINX config file from our host machine into container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# TSL SETUP
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/key.key -subj "/C=DE/ST=Berlin/L=Berlin/O=Inception Elise/CN=evan-ite.42.fr"

# expose HTTP and HTTPS ports to allow external connections
EXPOSE 443

# start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]