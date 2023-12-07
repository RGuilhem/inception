FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add curl wget

RUN apk add php \
	php-fpm

RUN rm -rf /etc/php/php-fpm.d/www.conf
COPY conf/default.conf /etc/php/php-fpm.d/www.conf

EXPOSE 9000
