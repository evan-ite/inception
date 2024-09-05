# Use the latest stable version of Debian as the base image
FROM debian:latest

# Install NGINX
RUN apt-get update && apt-get install -y nginx \
	curl \
	netcat-openbsd \
	iputils-ping

# Copy custom NGINX configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]


