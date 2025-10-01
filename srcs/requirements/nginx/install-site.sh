#!/bin/sh

if ! [ -e /var/www/wordle/index.html ]; then
    cd /var/www/
    rm -rf ./wordle/*
    git clone https://github.com/princess-mikus/wordle.git wordle
else
    echo "Wordle already installed"
fi

exec "nginx" "-g" "daemon off;"