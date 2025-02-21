FROM debian:bullseye

WORKDIR /var/www/html

RUN apt update -y && apt upgrade -y && apt install -y \
    wget \
    curl \
    php7.4 \
    php-fpm \
    php-mysql \
    mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

RUN wget https://wordpress.org/latest.tar.gz -O latest.tar.gz \
    && tar -xvzf latest.tar.gz \
    && mv wordpress/* /var/www/html/ \
    && rm -rf wordpress latest.tar.gz

COPY conf/config-script.sh /tmp/

RUN chmod +x /tmp/config-script.sh

ENTRYPOINT ["/tmp/config-script.sh"]