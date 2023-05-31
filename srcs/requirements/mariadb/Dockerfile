FROM alpine:3.14

RUN apk add --no-cache mariadb mariadb-client

RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/database

COPY ./conf/setup.sh /

ENTRYPOINT ["/setup.sh"]
