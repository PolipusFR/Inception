#!/bin/bash

sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|" /etc/php/7.4/fpm/pool.d/www.conf

	# Mettre à jour les informations de connexion à la base de données dans wp-config.php
	if [ -f /var/www/html/wp-config.php ]; then
		sed -i "s|__MYSQL_DATABASE__|$DATABASE_NAME|g" /var/www/html/wp-config.php
		sed -i "s|__MYSQL_USER__|$MYSQL_USER|g" /var/www/html/wp-config.php
		sed -i "s|__MYSQL_PASSWORD__|$MYSQL_PASSWORD|g" /var/www/html/wp-config.php
		sed -i "s|__DB_HOST__|$DB_HOST|g" /var/www/html/wp-config.php
	fi

	echo "Waiting for MariaDB. . ."
	until mysqladmin ping -hmariadb -u${MYSQL_USER} -p${MYSQL_PASSWORD} --silent; do
		sleep 2
	done

# Vérifier si WordPress n'est pas déjà configuré
if [ -f /var/www/html/.htaccess ] || [ -d /var/www/html/wp-content/uploads ]; then
    echo "WordPress is already configured. Skipping setup."
else
	echo "Downloading WordPress. . ."
	#Telecharger WordPress
	wp core download 	--allow-root \
						--path=/var/www/html

	#Installer WordPress
	echo "Installing WordPress. . ."
	wp core install 	--allow-root \
						--path=/var/www/html \
						--title="${WP_TITLE}" \
						--url=${DOMAIN_NAME} \
						--admin_user=${WP_ADMIN} \
						--admin_password=${WP_ADMIN_PASSWORD} \
						--admin_email="${WP_ADMIN}@student.42.fr"

	#Creer l'utilisateur supplémentaire
	echo "Creating user ${WP_USER} . . ."
	wp user create  	${WP_USER} \
						"${WP_USER}@user.com" \
						--allow-root \
						--role=author \
						--user_pass=${WP_USER_PASSWORD} \
						--path=/var/www/html
fi

echo "Wordpress setup completed."

echo "Starting PHP-FPM. . ."

exec php-fpm7.4 -F 

					