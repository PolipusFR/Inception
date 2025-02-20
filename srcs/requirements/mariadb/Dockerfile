FROM debian:oldstable

ARG DATABASE_NAME
ARG ADMIN_USER
ARG ADMIN_PWD

RUN apt update -y && apt upgrade -y && apt install -y \
    mariadb-server

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

COPY conf/my.cnf /etc/mysql/my.cnf

COPY conf/mariadb_script.sh /tmp/mariadb_script.sh

RUN chmod 777 /tmp/mariadb_script.sh && bash /tmp/mariadb_script.sh

CMD ["mysqldsafe"]