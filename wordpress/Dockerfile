FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    wget \
    && wget https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz -C /var/www \
    && mv /var/www/wordpress /var/www/html \
    && rm latest.tar.gz

COPY wp-config.php /var/www/html/wp-config.php

RUN chown -R www-data:www-data /var/www/html

CMD ["php-fpm7.4", "-F"]