FROM alpine:3.14

RUN apk add --no-cache nginx
RUN apk add --no-cache openssl

RUN mkdir -p /etc/nginx
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/setup.sh  /

ENTRYPOINT ["/setup.sh"]
#ENTRYPOINT ["sleep", "infinitty"]
