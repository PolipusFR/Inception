FROM debian:oldstable

RUN apt update -y && apt upgrade -y && apt install -y \
    nginx \
    openssl

RUN openssl req -x509 -nodes \
    -keyout /etc/ssl/private/inception.key \
    -out /etc/ssl/certs/inception.crt \
    -subj "/C=FR/ST=ARH/L=Lyon/CN=lsabatie.42.fr/UID=lsabatie"

COPY conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www/html \
    && chown -R www-data:www-data /var/www/

CMD ["nginx", "-g", "daemon off;"]