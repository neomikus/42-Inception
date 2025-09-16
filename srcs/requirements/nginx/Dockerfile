#alpine:latest is 3.21.X at time of writing this dockerfile
FROM alpine:3.20.6

RUN apk update && apk upgrade
RUN apk add nginx
RUN apk add openssl

COPY nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/http.d/default.conf

EXPOSE 443 443

CMD ["nginx", "-g", "daemon off;"]