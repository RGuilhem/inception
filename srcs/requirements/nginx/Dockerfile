FROM alpine:latest

RUN apk update
RUN apk upgrade

RUN apk add nginx
RUN mkdir -p /var/www/html/
COPY conf/default.conf /etc/nginx/http.d/default.conf

RUN apk add openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj \
	"/C=CH/ST=Vaud/L=Lausanne/0=42/OU=42/CN=graux.42.fr/UID=graux"

RUN chmod 755 /var/www/html
#RUN chown -R www-data:www-data /var/www/html

#DAEMON
RUN apk add openrc
RUN rc-update add nginx default

EXPOSE 443
USER www-data
CMD ["nginx", "-g", "daemon off;"]
