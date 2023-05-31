#!/bin/sh

if [ ! -d "/database/$DB_NAME" ]
then
	mysqld_safe --datadir=/database & #start server
	sleep 1 #wait until server is up and running

	#secure installaiton
mariadb-secure-installation << END


	y
	$MYSQL_ROOT_PASSWD
	$MYSQL_ROOT_PASSWD
	y
	y
	y
	y
END

	#Create user
	mysql -e "CREATE DATABASE $DB_NAME;CREATE USER $MYSQL_USR@localhost \
		IDENTIFIED BY '$MYSQL_PASSWD';GRANT ALL PRIVILEGES ON $DB_NAME.* TO \
		$MYSQL_USR@localhost;FLUSH PRIVILEGES;"

	mysqladmin -u root shutdown #shutdown server
fi

exec mysqld_safe --datadir=/database
#exec sleep infinity
