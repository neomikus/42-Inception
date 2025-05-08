#alpine:latest is 3.21.X at time of writing this dockerfile
FROM alpine:3.20.6

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client mariadb-common
RUN mkdir /run/mysqld

RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

COPY init.sql /etc/mysql/
#COPY my.cnf /etc/
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf 

CMD ["mysqld"]