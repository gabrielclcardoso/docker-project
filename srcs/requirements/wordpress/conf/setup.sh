#!/bin/sh

if [ ! -d "/www/wordpress" ]
then
	wget https://wordpress.org/latest.tar.gz
	tar -xvf latest.tar.gz
	rm latest.tar.gz
	mv wordpress www/
	cd www/wordpress
	mv wp-config-sample.php wp-config.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config.php
	sed -i "s/username_here/$MYSQL_USR/g" wp-config.php
	sed -i "s/password_here/$MYSQL_PASSWD/g" wp-config.php
	sed -i "s/localhost/localhost:3306/g" wp-config.php
fi

exec php-fpm8 -F
