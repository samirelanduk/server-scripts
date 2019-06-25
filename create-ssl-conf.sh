#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Need website name'
    exit 0
fi

filename="/etc/nginx/snippets/ssl-$1.conf"

touch $filename

cat > $filename <<- EOM
ssl_certificate /etc/letsencrypt/live/$1/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/$1/privkey.pem;
EOM