FROM alpine:3.14

RUN apk add --no-cache php8 php8-fpm php8-mysqli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/setup.sh /
COPY ./conf/www.conf /etc/php8/php-fpm.d/

ENTRYPOINT ["/setup.sh"]
#ENTRYPOINT ["sleep", "infinity"]
