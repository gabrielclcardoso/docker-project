FROM alpine:3.14

RUN apk add --no-cache php7 php7-fpm php7-mysqli php7-phar \
php7-json php7-mbstring

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup.sh /
COPY ./conf/www.conf /etc/php7/php-fpm.d/

ENTRYPOINT ["/setup.sh"]
