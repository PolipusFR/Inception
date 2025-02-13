FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y \
    wget \
    php7.4 \
    php-fpm \
    php-mysql \
    mariadb-client

RUN mkdir -p /var/www/wordpress 

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar \
    && chmod +x wp-cli-2.7.0.phar \
    && mv wp-cli-2.7.0.phar /usr/local/bin/wp

COPY conf/config-script.sh /var/
RUN chmod +x /var/config-script.sh

ENTRYPOINT ["/var/config-script.sh"]

EXPOSE 9000