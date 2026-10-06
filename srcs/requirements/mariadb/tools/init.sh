#!/bin/sh

set -e

echo "Starting MariaDB..."

if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo "Initializing MariaDB database..."
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

exec mariadbd