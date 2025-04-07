#alpine:latest is 3.21.X at time of writing this dockerfile
FROM alpine:3.20.6

RUN apk update && apk upgrade
RUN apk add openrc php-fpm wget
#RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
#RUN mkdir /usr/share/webapps
#RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

#CMD ["php-fpm", "-F"]
#RUN nginx -g "daemon off;"
#RUN nginx