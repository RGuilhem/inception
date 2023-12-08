FROM alpine:3.19

RUN apk update
RUN apk upgrade
RUN apk add nginx

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
