FROM debian:bullseye

RUN apt update -y && apt install -y \
    wget \
    curl \
    php7.4 \
    php-fpm \
    php-mysql \
    mariadb-client

RUN mkdir -p /var/run && mkdir -p /run/php
RUN apt update && apt install -y netcat

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/wp-config.php /var/www/html/wp-config.php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.debian

# RUN curl -o /home/lsabatie/data/wordpress_vol/favicon.ico https://www.example.com/favicon.ico

RUN mkdir -p /var/www/html/wp-content/upgrade
RUN chmod 777 /var/www/html/wp-content/upgrade
COPY ./conf/config-script.sh /usr/local/bin/config-script.sh
RUN chmod +x /usr/local/bin/config-script.sh

EXPOSE 9000

CMD ["/usr/local/bin/config-script.sh"]