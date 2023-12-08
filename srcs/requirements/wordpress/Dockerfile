FROM alpine:3.19

RUN apk update
RUN apk upgrade

RUN apk add php
RUN apk add php-fpm
RUN apk add wget
RUN apk add php-mysqli
RUN apk add mariadb-client

COPY conf/www.conf /etc/php/fpm/pool.d
COPY conf/ /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh

ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

EXPOSE 9000
CMD ["/usr/sbin/php-fpm82", "--nodaemonize"]
