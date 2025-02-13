FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y \
    nginx \
    openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=FR/ST=ARH/L=Lyon/CN=lsabatie.42.fr/UID=lsabatie"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html \
    && chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443