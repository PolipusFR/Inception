FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y \
    mariadb-server

COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d
COPY conf/init.sql /docker-entrypoint-initdb.d/
COPY conf/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD [ "/entrypoint.sh" ]

EXPOSE 3306