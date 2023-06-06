#!/bin/sh

#import ssl certificate
mkdir -p /etc/ssl/private
echo "-----BEGIN CERTIFICATE-----" > /etc/ssl/certs/nginx-selfsigned.crt
echo $SELF_SIGNED_CRT >> /etc/ssl/certs/nginx-selfsigned.crt
echo -n "-----END CERTIFICATE-----" >> /etc/ssl/certs/nginx-selfsigned.crt

echo "-----BEGIN PRIVATE KEY-----" > /etc/ssl/private/nginx-selfsigned.key
echo $SELF_SIGNED_KEY >> /etc/ssl/private/nginx-selfsigned.key
echo -n "-----END PRIVATE KEY-----" >> /etc/ssl/private/nginx-selfsigned.key

exec nginx
