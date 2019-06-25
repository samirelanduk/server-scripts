#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Need website name'
    exit 0
fi
if [[ $# -eq 1 ]] ; then
    echo 'Need website directory'
    exit 0
fi

filename="./$1"

sitename=$1
doublesitename=$1

dotcount="$(awk -F'.' '{print NF-1}' <<< $1)"

if [[ $dotcount -eq 1 ]] ; then
    doublesitename="$sitename www.$sitename"
fi

cat > /etc/nginx/sites-available/$filename <<- EOM
server {
    listen 80;
    listen [::]:80;
    server_name $doublesitename;
    return 301 https://\$server_name\$request_uri;
    client_max_body_size 50M;
}

server {
    client_max_body_size 50M;
    location / {
        alias $2/$1/;
    }
    location /.well-known {
        alias /var/www/html/.well-known;
        allow all;
    }
    server_name $doublesitename;
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    include snippets/ssl-$sitename.conf;
    include snippets/ssl-params.conf;
}
EOM