FROM debian:bullseye

# Install PHP and necessary extensions
RUN apt-get update && apt-get install -y php php-mysqli wget

# Download Adminer
RUN wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer.php

# Expose port 8080
EXPOSE 8484

# Start PHP built-in server
CMD ["php", "-S", "0.0.0.0:8484", "-t", "/var/www/html", "/var/www/html/adminer.php"]
