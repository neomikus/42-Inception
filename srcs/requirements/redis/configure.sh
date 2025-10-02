#!/bin/sh

redispwd=$(cut -d '\n' -f2 /run/secrets/redis-password)

exec "redis-server" "--requirepass" "$redispwd"