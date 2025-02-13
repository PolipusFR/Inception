FROM debian:bullseye

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD

RUN apt update -y && apt upgrade -y && apt install -y \
    mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY conf/init.sql /docker-entrypoint-initdb.d/
COPY conf/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD [ "/entrypoint.sh" ]

EXPOSE 3306