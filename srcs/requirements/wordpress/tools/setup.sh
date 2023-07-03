#!/bin/sh

if [ ! -d "/www/wordpress" ]
then
	wp core download --path=/www/wordpress/
	if [ $? != 0 ]
	then
		rmdir /www/wordpress
		exit 0
	fi
	cd www/wordpress
	mv wp-config-sample.php wp-config.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config.php
	sed -i "s/username_here/$MARIADB_USR/g" wp-config.php
	sed -i "s/password_here/$MARIADB_PASSWD/g" wp-config.php
	sed -i "s/localhost/$DB_HOST:3306/g" wp-config.php
	sed -i "s-http://example.com-$DOMAIN_NAME-g" wp-config.php
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE \
		--admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD \
		--admin_email=$WP_EMAIL --skip-email
	wp user create $WP_USER $EMAIL --user_pass=$WP_USER_PASSWD
fi

exec php-fpm7 -F
