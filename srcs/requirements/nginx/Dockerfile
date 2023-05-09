FROM alpine:3.14

RUN apk add --no-cache nginx

COPY ./conf/nginx.conf /etc/nginx/

COPY ./tools/index.html /data/www

EXPOSE 443

CMD nginx
