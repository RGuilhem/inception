FROM alpine:3.19

ARG MYSQL_DB
ARG MYSQL_USER
ARG MYSQL_USER_PASS
ARG MYSQL_ROOT_PASS

RUN apk update
RUN apk upgrade
RUN apk add mariadb
RUN apk add mariadb-common
RUN apk add mariadb-server-utils
RUN apk add mariadb-client


RUN rm -f /etc/mysql/my.cnf \
	/etc/my.cnf \
	~/my.cnf
COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/my.cnf /etc/my.cnf
COPY conf/my.cnf ~/my.cnf

RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown -R mysql /var/lib/mysql
RUN chmod 777 /var/lib/mysql

COPY conf/init_db_user.sh /bin/mdb_setup.sh
RUN chmod +x /bin/mdb_setup.sh

RUN apk add openrc
#RUN rc-update add mariadb default

EXPOSE 3306
CMD ["tail", "-f"]
