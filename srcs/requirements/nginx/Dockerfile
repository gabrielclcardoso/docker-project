FROM alpine:3.14

RUN apk add --no-cache nginx
RUN apk add --no-cache openssl

RUN mkdir -p /etc/ssl/private
RUN mkdir -p /etc/ssl/private

COPY ./conf/input.txt /
RUN openssl req -x509 -nodes -days 1 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt <input.txt
RUN rm /input.txt

RUN mkdir -p /etc/nginx
COPY ./conf/nginx.conf /etc/nginx/
RUN mkdir -p /data/www
COPY ./tools/index.html /data/www/

EXPOSE 443

CMD nginx
