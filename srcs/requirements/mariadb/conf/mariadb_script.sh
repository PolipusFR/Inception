#!/bin/bash

if [ -d "/var/lib/mysql/${DATABASE_NAME}" ]; then
    echo "Mariadb already set up."
else
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

    mysqld --skip-networking --socket=/var/run/mysqld/mysqld.sock &
    pid="$!"

    for i in {30..0}; do
        if mysqladmin ping --socket=/var/run/mysqld/mysqld.sock --silent; then
            echo "MariaDB is ready!"
            break
        fi
        echo "Waiting for MariaDB. . ."
        sleep 2
    done

    if [ "$i" = 0 ]; then
        echo "Error while initialiwing MariaDB."
        exit 1
    fi

    mysql -u root -e \
        "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME; \
        CREATE USER IF NOT EXISTS '$ADMIN_USER'@'%' IDENTIFIED BY '$ADMIN_PASSWORD'; \
        GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$ADMIN_USER'@'%'; \
        FLUSH PRIVILEGES;"
    
    kill -s TERM "$pid"
    wait "$pid"
    echo

exec mysqld