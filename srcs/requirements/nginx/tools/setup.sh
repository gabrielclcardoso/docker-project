#!/bin/sh

#Create ssl certificate
mkdir -p /etc/ssl/private
openssl req -x509 -nodes -days 1 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt << END
$COUNTRY
$CITY
$STATE
$COMPANY
$TEAM
$DOMAIN_NAME
$EMAIL
END

exec nginx
