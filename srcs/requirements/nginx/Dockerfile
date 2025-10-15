#alpine:latest is 3.22.X at time of writing this dockerfile
FROM alpine:3.21.5

RUN apk update && apk upgrade
RUN apk add nginx openssl git

COPY nginx.conf /etc/nginx/nginx.conf
COPY self-signed.conf /etc/nginx/self-signed.conf
RUN rm -rf /etc/nginx/http.d/default.conf

EXPOSE 443 443

RUN mkdir -p /var/www/wordle
COPY install-site.sh /
RUN chmod +x install-site.sh

CMD ["./install-site.sh"]