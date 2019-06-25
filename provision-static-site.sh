#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Need website name'
    exit 0
fi

location=$HOME

if [[ $# -eq 2 ]] ; then
    location=$2
fi

./create-certificate.sh $1
./create-ssl-conf.sh $1
./create-static-conf.sh $1 $location
ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/$1
./create-static-directory.sh $1 $location