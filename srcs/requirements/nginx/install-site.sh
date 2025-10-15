#!/bin/sh

if ! [ -e /var/www/wordle/index.html ]; then
    cd /var/www/site
    git clone https://github.com/neomikus/wordle.git wordle
else
    echo "Wordle already installed"
fi

exec "nginx" "-g" "daemon off;"