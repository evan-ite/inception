# base image
FROM debian:latest

# Install NGINX
RUN apt-get update && apt-get install -y nginx \
	curl \
	netcat-openbsd \
	iputils-ping

# copy custom NGINX config file from our host machine into container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# TSL SETUP
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/key.key -subj "/C=DE/ST=Berlin/L=Berlin/O=Inception Elise/CN=evan-ite.42.fr"

# expose HTTP and HTTPS ports to allow external connections
EXPOSE 443

# start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]