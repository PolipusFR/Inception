#!/bin/bash

echo "Starting MariaDB..."
#Run mariadb in the background
mysqld_safe --datadir=/var/lib/mysql &

#wait for the db to be available
until mysqladmin ping -u root -p$SQL_ROOT_PASSWORD --silent; do
    echo "Waiting for database to start..."
    sleep 2
done

#execute init.sql
echo "Executing init.sql..."
mysql -u root -p$SQL_ROOT_PASSWORD < /docker-entrypoint-initdb.d/init.sql

echo "MariaDB is ready!"
#ready! wait keeps the container running
wait