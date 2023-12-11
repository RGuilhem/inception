FROM alpine:3.19

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-out /etc/ssl/graux.crt \
	-keyout /etc/ssl/graux.key \
	-subj "/C=CH/ST=Vaud/L=Renens/0=42Lausanne/OU=graux/CN=graux"

COPY ./conf/ /etc/nginx/http.d/

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
