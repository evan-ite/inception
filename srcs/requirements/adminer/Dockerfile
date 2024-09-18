FROM debian:bullseye

RUN apt-get update && apt-get install -y php php-mysqli wget

RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/html/adminer.php

EXPOSE 8484

CMD ["php", "-S", "0.0.0.0:8484", "-t", "/var/www/html", "/var/www/html/adminer.php"]
