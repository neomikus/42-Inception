#alpine:latest is 3.22.X at time of writing this dockerfile
FROM alpine:3.21.5

RUN apk update && apk upgrade
RUN apk add redis

COPY redis.conf /etc/redis.conf
COPY configure.sh /configure.sh
RUN chmod +x configure.sh

CMD ["./configure.sh"]
