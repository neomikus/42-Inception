#alpine:latest is 3.22.X at time of writing this dockerfile
FROM alpine:3.21.5

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client mariadb-common
RUN mkdir -p /run/mysqld && chmod 750 /var/lib/mysql

RUN mkdir -p /etc/mysql && touch /etc/mysql/init.sql
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf 

COPY mariadb.sh /mariadb.sh 
RUN chmod +x mariadb.sh

CMD ["/mariadb.sh"]