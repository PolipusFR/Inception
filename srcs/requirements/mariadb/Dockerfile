FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y \
    mariadb-server

RUN mkdir -p /var/run/mysqld \
    && mkdir -p /run/mysqld \
    && chown -R mysql:root /run/mysqld \
    && chown -R mysql:root /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/mariadb_script.sh /usr/local/bin/mariadb_script.sh

RUN chmod 777 /usr/local/bin/mariadb_script.sh

EXPOSE 3306

CMD ["/usr/local/bin/start.sh"]