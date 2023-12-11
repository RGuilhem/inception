#!/bin/sh
echo "Start BASH SCRIPT" > my_bashLog.txt
env > /tmp/test
while ! mariadb -u $MYSQL_USER --password=$MYSQL_USER_PASS -P 3306 $WORDPRESS_DB_NAME ; do
	sleep 3
	echo "Error connecting to db" >> my_bashLog.txt
done


echo "Awaken" >> my_bashLog.txt

mkdir -p /run/php/;
touch /run/php/php-fpm.pid;

if [ -f ./wordpress/wp-config.php ]
then
	echo "wordpress already downloaded" > my_bashLog.txt
else
	echo "Trying to DL" >> my_bashLog.txt
	chown -R www-data:www-data /var/www/*
	chmod -R 755 /var/www/*
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp	
	ls -l /var/www/html >> content.txt
	cd /var/www/html || exit
	wp core download --allow-root
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PASS --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_DB_ADMIN --admin_password=$WORDPRESS_DB_ADMIN_PWD --admin_email=$WORDPRESS_DB_ADMIN_MAIL --skip-email --allow-root
	wp user create $WORDPRESS_DB_USER $WORDPRESS_DB_MAIL --role=author --user_pass=$WORDPRESS_DB_PASSWORD --allow-root
	echo "Done setting up" >> my_bashLog.txt
	
fi

exec "$@"
