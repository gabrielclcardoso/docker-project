FROM alpine:3.14

RUN apk add --no-cache php8-fpm php8-mysqli

COPY ./conf/setup.sh /

ENTRYPOINT ["/setup.sh"]
#ENTRYPOINT ["sleep", "infinity"]
