openssl req -x509 -nodes -newkey rsa:2048 \
    -keyout /etc/ssl/private/openssl.key \
    -out /etc/ssl/certs/openssl.crt \
    -subj "/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/O=42School/OU=42Lyon/CN=lsabatie"