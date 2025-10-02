#alpine:latest is 3.21.X at time of writing this dockerfile
FROM alpine:3.20.6

# Installing php83 specifically since it was the latest when I started
RUN apk update && apk upgrade
RUN apk add openrc php83 php83-phar php83-fpm php83-mysqli php83-iconv php83-tokenizer php83-redis php83-ctype wget netcat-openbsd

COPY www.conf /etc/php83/php-fpm.d/
COPY php.ini /etc/php83/

COPY wp-install.sh /
RUN chmod +x wp-install.sh

CMD ["./wp-install.sh"]
