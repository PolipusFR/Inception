#!/bin/bash

WP_PATH='/var/www/wordpress'

until mysqladmin ping -h"mariadb" --silent; do
    echo "Waiting for database connection..."
    sleep 2
done

echo "Here1"

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    if [ ! "$(ls -A /var/www/wordpress)" ]; then 
        wp core download --path=$WP_PATH --allow-root
	fi
	echo "Here3"
		wp config create	--allow-root \
							--dbname=$SQL_DATABASE \
							--dbuser=$SQL_USER \
							--dbpass=$SQL_PASSWORD \
							--dbhost=mariadb:3306 --path='/var/www/wordpress'

		wp core install --url=lsabatie.42.fr \
						--title=lsabatieWordpress \
						--admin_user=$ADMIN_USER \
						--admin_password=$ADMIN_PASSWORD \
						--admin_email=$ADMIN_MAIL \
						--allow-root \
						--path=$WP_PATH
		
		wp user create  $WP_USER \
						$WP_MAIL \
						--user_pass=$WP_PWD \
						--role=contributor \
						--allow-root \
						--path=$WP_PATH

fi

echo "Here4"

mkdir -p /run/php/
/usr/sbin/php-fpm7.4 -F 

					