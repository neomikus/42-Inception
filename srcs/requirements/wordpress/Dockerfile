#alpine:latest is 3.21.X at time of writing this dockerfile
FROM alpine:3.20.6

RUN apk update && apk upgrade
RUN apk add openrc php php-phar php-fpm php-mysqli wget

COPY www.conf /etc/php83/php-fpm.d/
COPY php.ini /etc/php83/

COPY wp-install.sh /
RUN mkdir -p /var/www/html
RUN cd /var/www/html
RUN chmod +x /wp-install.sh

CMD ["/wp-install.sh"]
