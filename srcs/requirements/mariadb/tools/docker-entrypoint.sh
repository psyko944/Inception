#!/bin/bash

if [[ ! -d "/var/lib/mysql/$SQL_DATABASE" ]]; then
    mariadb-install-db --user=mysql
    service mariadb start
    mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
    mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"
    service mariadb stop
    echo "MariaDB database and user were created successfully! "
fi

exec "$@"