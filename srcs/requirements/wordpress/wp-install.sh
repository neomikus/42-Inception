#!/bin/sh

username=$WP_USERNAME
userpwd=$(cut -d '\n' -f2 /run/secrets/wp-user-password)
adminuser=$(cut -d '\n' -f2 /run/secrets/wp-admin-user)
adminpwd=$(cut -d '\n' -f2 /run/secrets/wp-admin-password)
dbname=$(cut -d '\n' -f2 /run/secrets/db-user)
dbpwd=$(cut -d '\n' -f2 /run/secrets/db-password)
redispwd=$(cut -d '\n' -f2 /run/secrets/redis-password)

cd /var/www/site

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if ! [ -e /var/www/site/wp-config.php ]; then

    wp core download --allow-root

    while ! nc -z mariadb 3306; do
        printf "Waiting for MariaDB...\n"
        sleep 1;
    done    

    wp config create --dbname=wordpress --dbuser=$dbname --dbpass=$dbpwd --dbhost=mariadb --allow-root
    wp config set WP_REDIS_HOST "redis" --allow-root
    wp config set WP_REDIS_PORT 6379 --raw --allow-root
    wp config set WP_REDIS_PASSWORD $redispwd
    wp core install --url=$DOMAIN_NAME --title=inception --admin_user=$adminuser --admin_password=$adminpwd --admin_email=$adminuser@example.com --allow-root
    wp user create $username $username@example.com --role=author --user_pass=$userpwd
    wp plugin install redis-cache --activate
    wp theme install retrogeek --activate
else
    echo "Wordpress already installed"
fi

wp redis enable

exec "php-fpm83" "-F"