#alpine:latest is 3.21.X at time of writing this dockerfile
FROM alpine:3.20.6

RUN apk update && apk upgrade
RUN apk add mariadb
RUN mkdir /run/mysqld

COPY my.cnf /etc/
COPY init.sql /etc/mysql/

RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

CMD ["mysqld"]