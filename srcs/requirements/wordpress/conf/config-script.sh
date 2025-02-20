#!/bin/bash

wp config create	--allow-root \
					--dbname="$SQL_DATABASE" \
					--dbuser="$SQL_USER" \
					--dbpass="$SQL_PASSWORD" \
					--dbhost=mariadb \
					--path="$WP_PATH"

wp core install 	--allow-root \
					--path="$WP_PATH" \ 
					--title="$WP_TITLE" \
					--url="$DOMAIN_NAME" \
					--admin_user="$ADMIN_USER" \
					--admin_password="$ADMIN_PASSWORD" \
					--admin_email="$ADMIN_MAIL" \
		
wp user create  	--allow-root \
					--path="$WP_PATH" \
					"$USER_NAME" \
					"$USER_EMAIL" \
					--user_pass="$USER_PWD" \
					--role=contributor \

exec php-fpm7.4 -F 

					