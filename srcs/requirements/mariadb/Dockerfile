FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server mariadb-client gettext

ENV MYSQL_DATABASE=wordpress_db

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/setup-db.sh /usr/local/bin/setup-db.sh
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/setup-db.sh /usr/local/bin/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
