FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

COPY config/mariadb.cnf /etc/mysql/my.cnf

VOLUME /var/lib/mysql

EXPOSE 3306

CMD ["mysqld_safe"]