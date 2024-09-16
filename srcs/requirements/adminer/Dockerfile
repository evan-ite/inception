FROM debian:bullseye

RUN apt-get update && apt-get install -y php php-mysqli wget

RUN wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer.php

EXPOSE 8484

CMD ["php", "-S", "0.0.0.0:8484", "-t", "/var/www/html", "/var/www/html/adminer.php"]
