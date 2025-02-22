#!/bin/bash

echo "Configuring Nginx. . ."

# Vérifier si la configuration NGINX est valide
nginx -t
if [ $? -ne 0 ]; then
    echo "NGINX configuration is invalid. Exiting."
    exit 1
fi

echo "nginx setup completed."

# Démarrer NGINX comme processus principal
exec nginx -g 'daemon off;'