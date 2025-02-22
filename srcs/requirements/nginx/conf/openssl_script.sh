openssl req -x509 -nodes -newkey rsa:2048 \
    -keyout /etc/ssl/private/openssl.key \
    -out /etc/ssl/certs/openssl.crt \
    -subj "/C=FR/ST=Lyon/L=Lyon/O=42/OU=42/CN=lsabatie"