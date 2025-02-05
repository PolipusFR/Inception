#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout example.com.key -out example.com.crt \
    -subj "/C=FR/ST=Lyon/L=Lyon/O=42Lyon/CN=lsabatie.42.fr"