FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y \
    nginx \
    openssl


COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/nginx_script.sh /usr/local/bin/nginx_script.sh
COPY conf/openssl_script.sh /usr/local/bin/openssl_script.sh

RUN chmod +x /usr/local/bin/nginx_script.sh /usr/local/bin/openssl_script.sh

RUN /usr/local/bin/openssl_script.sh

EXPOSE 443

CMD ["/usr/local/bin/nginx_script.sh"]