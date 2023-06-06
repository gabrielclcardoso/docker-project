#!/bin/sh

if [ ! -d "/database/$DB_NAME" ]
then
	mysqld_safe --datadir=/database & #start server
	sleep 1 #wait until server is up and running

#secure installaiton
mariadb-secure-installation << END

y
y
$MARIADB_ROOT_PASSWD
$MARIADB_ROOT_PASSWD
y
n
y
y
END

	#Create user
	mysql -e "CREATE DATABASE $DB_NAME;CREATE USER $MARIADB_USR@'%'\
		IDENTIFIED BY '$MARIADB_PASSWD';GRANT ALL PRIVILEGES ON $DB_NAME.* TO \
		$MARIADB_USR@'%';FLUSH PRIVILEGES;"

	mysqladmin -u root shutdown #shutdown server
fi

exec mysqld_safe --datadir=/database
