FROM alpine:3.19

RUN apk update
RUN apk upgrade

RUN apk add wget
RUN apk add mariadb-client
RUN		apk add php \
				php-fpm \
				php-opcache \
				php-mysqli \
				php-session \
				php-iconv \
				php-json \
				php-gd \
				php-curl \
				php-xml \
				php-common \
				php-imap \
				php-cgi \
				php-pdo \
				php-pdo_mysql \
				php-soap \
				#php-xmlrpc \
				php-posix \
				#php-mcrypt \
				php-redis \
				php-gettext \
				php-ldap \
				php-ctype \
				php-dom \
				php-phar \
				php-gd \
				php-zlib

COPY conf/www.conf /etc/php/fpm/pool.d
COPY conf/ /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh

ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

EXPOSE 9000
CMD ["/usr/sbin/php-fpm82", "--nodaemonize"]
