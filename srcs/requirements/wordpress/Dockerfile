FROM alpine:3.14

RUN apk add --no-cache php8 php8-fpm php8-mysqli

COPY ./conf/setup.sh /
COPY ./conf/www.conf /etc/php8/php-fpm.d/

ENTRYPOINT ["/setup.sh"]
#ENTRYPOINT ["sleep", "infinity"]
