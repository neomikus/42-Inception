#!/bin/sh

source /run/secrets/wp-admin-password
source /run/secrets/wp-admin-user
source /run/secrets/wp-user-password
source /run/secrets/db-user
source /run/secrets/db-password

username=$WP_USERNAME
userpwd=$WP_USERPWD
adminuser=$WP_ADMINUSER
adminpwd=$WP_ADMINPWD
dbname=$DB_USERNAME
dbpwd=$DB_PWD

if ! [ -e /var/www/html/wp-config.php ]; then
    cd /var/www/html
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root
    wp config create --dbname=wordpress --dbuser=$dbname --dbpass=$dbpwd --dbhost=mariadb --allow-root
    wp core install --url=$DOMAIN_NAME --title=inception --admin_user=$adminuser --admin_password=$adminpwd --admin_email=$adminuser@example.com --allow-root
    wp user create $username $username@example.com --role=author --user_pass=$userpwd
    wp theme install twentysixteen --activate
else
    echo "Wordpress already installed"
fi

exec "php-fpm83" "-F"