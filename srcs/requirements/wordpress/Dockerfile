#alpine:latest is 3.21.X at time of writing this dockerfile
FROM alpine:3.20.6

RUN apk update && apk upgrade
RUN apk add openrc php php-phar php-fpm php-mysqli wget

COPY www.conf /etc/php83/php-fpm.d/

#RUN mkdir -p /usr/share/webapps && mkdir -p /var/www/html
#RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz -C /usr/share/webapps && rm latest.tar.gz
#RUN ln -s /usr/share/webapps/wordpress/ /var/www/html/wordpress
COPY wp-install.sh /
RUN mkdir -p /var/www/html
#RUN chmod +x /wp-install.sh && /wp-install.sh

CMD ["php-fpm83", "-F"]