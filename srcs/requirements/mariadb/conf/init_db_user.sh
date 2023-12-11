#!/bin/sh

cat << EOF > /tmp/init_db_user.sql
CREATE DATABASE IF NOT EXISTS $MYSQL_DB;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASS';
GRANT ALL ON $MYSQL_DB.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASS';
FLUSH PRIVILEGES;
EOF

/usr/bin/mariadbd --user=mysql & sleep 2
/usr/bin/mariadb -h localhost < /tmp/init_db_user.sql

pkill mariadbd
/usr/bin/mariadbd --user=mysql
