FROM alpine:latest

RUN apk update
RUN apk upgrade

RUN apk add nginx
RUN mkdir -p /var/www/html/
COPY conf/default.conf /etc/nginx/http.d/default.conf

#DAEMON
RUN apk add openrc
RUN rc-update add nginx default

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
