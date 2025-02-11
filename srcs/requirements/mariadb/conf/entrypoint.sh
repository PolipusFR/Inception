#!/bin/bash

#Run mariadb in the background
mysqld_safe &

#wait for the db to be available
until mysqladmin ping -h"localhost" --silent; do
    sleep 2
done

#execute init.sql
mysql -u root -p"$SQL_ROOT_PASSWORD" < /docker-entrypoint-initdb.d/init.sql


#ready! wait keeps the container running
wait