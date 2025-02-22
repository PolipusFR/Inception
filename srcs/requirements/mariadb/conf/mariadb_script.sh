#!/bin/bash

if [ -d "/var/lib/mysql/${DATABASE_NAME}" ]; then
    echo "Mariadb already set up."
else
    mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

    mysqld --skip-networking --socket=/var/run/mysqld/mysqld.sock &
    pid="$!"

    echo "Waiting for MariaDB. . ."
    for i in {30..0}; do
        if mysqladmin ping --socket=/var/run/mysqld/mysqld.sock --silent; then
            echo "MariaDB is ready!"
            break
        fi
        sleep 2
    done

    if [ "$i" = 0 ]; then
        echo "Error while initialiwing MariaDB."
        exit 1
    fi

    mysql -u root -e "DROP TABLE IF EXISTS mysql.user;"
    mysql -u root -e "DROP VIEW IF EXISTS mysal.user;"
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
    mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    mysql -u root -e "GRANT ALL ON *.* TO '$MYSQL_ROOT_USER'@'%';"
    mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -u root -e "GRANT ALL ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    
    kill -s TERM "$pid"
    wait "$pid"
    echo "MariaDB has been correctly set up."
fi

exec mysqld