FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx \
	curl netcat-openbsd iputils-ping

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/key.key -subj "/C=DE/ST=Berlin/L=Berlin/O=Inception Elise/CN=evan-ite.42.fr"

RUN mkdir -p /var/www/html/static
COPY conf/html/index.html /var/www/html/static/index.html
COPY conf/html/barbie.png /var/www/html/static/barbie.png

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
