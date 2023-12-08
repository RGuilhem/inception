FROM alpine:3.19

RUN apk update
RUN apk upgrade

RUN apk add php
RUN apk add php-fpm
RUN apk add wget
RUN apk add php-mysqli

COPY conf/www.conf /etc/php/fpm/pool.d
COPY conf/create_wordpress.sh /bin/create_wordpress.sh
RUN chmod +x /bin/create_wordpress.sh

ENTRYPOINT ["create_wordpress.sh"]

EXPOSE 9000
CMD ["tail", "-f"]
