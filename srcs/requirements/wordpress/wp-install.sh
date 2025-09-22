#!/bin/sh
#sleep 5

if ! [ -e /var/www/html/wp-config.php ]; then
    cd /var/www/html
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root
    wp config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
    wp core install --url=fcasaubo.42.fr --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root
    wp theme install twentysixteen --activate
else
    echo "Wordpress already installed"
fi

php-fpm83 "-F"