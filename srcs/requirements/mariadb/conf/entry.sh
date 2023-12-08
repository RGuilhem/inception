#!/bin/sh

mkdir -p /home/graux/data/database
mkdir -p /home/graux/data/www

/usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql & sleep 2

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_USER_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DB}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_USER_PASS}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';"
mysql -e "FLUSH PRIVILEGES;"

#TODO remove after test!!!!!
#sed -i '/^bind-address/c\bindaddress=0.0.0.0' /etc/mysql/my.cnf
pkill mysqld
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql
