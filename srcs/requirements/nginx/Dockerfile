#alpine:latest is 3.21.X at time of writing this dockerfile
FROM alpine:3.20.6
WORKDIR /usr/local/app

RUN apk update && apk upgrade
RUN apk add nginx
RUN apk add openssl

COPY nginx.conf /etc/nginx/nginx.conf
COPY site-content/www /data/www
CMD ["nginx", "-g", "daemon off;"]
#RUN nginx -g "daemon off;"
#RUN nginx