#!/bin/sh

dbname=$(cut -d '\n' -f2 /run/secrets/db-user)
dbpwd=$(cut -d '\n' -f2 /run/secrets/db-password)

echo $(date)

cat <<EOF > /etc/mysql/init.sql
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE OR REPLACE USER '$dbname'@'%' IDENTIFIED BY '$dbpwd';
GRANT ALL PRIVILEGES ON *.* TO '$dbname'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

echo $(date)

mysql_install_db --ldata=/var/lib/mysql

echo $(date)

exec mysqld