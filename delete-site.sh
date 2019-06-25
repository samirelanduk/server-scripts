#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Need website name'
    exit 0
fi

echo "This will delete $1 permanently! Type again if you're sure:"
read second

if [[ $1 != $second ]] ; then
    echo "Didn't match, doing nothing"
    exit 0
fi

location=$HOME

if [[ $# -eq 2 ]] ; then
    location=$2
fi

rm -r /etc/letsencrypt/live/$1 2>/dev/null 
rm -r /etc/letsencrypt/archive/$1 2>/dev/null 
rm /etc/letsencrypt/renewal/$1.conf 2>/dev/null 

rm /etc/nginx/snippets/ssl-$1.conf 2>/dev/null 
rm /etc/nginx/sites-available/$1 2>/dev/null 
rm /etc/nginx/sites-enabled/$1 2>/dev/null 

rm -r $location/$1 2>/dev/null

rm /etc/systemd/system/$1.service
systemctl daemon-reload