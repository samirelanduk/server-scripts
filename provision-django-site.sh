#!/bin/bash

if (( $EUID != 0 )); then
    echo "I only take orders from superusers - use sudo"
    exit
fi
if [[ $# -eq 0 ]] ; then
    echo 'Need website name'
    exit 0
fi

if [[ $# -eq 1 ]] ; then
    echo 'Need python version'
    exit 0
fi

location=$HOME

if [[ $# -gt 2 ]] ; then
    location=$3
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$DIR/create-certificate.sh $1
$DIR/create-ssl-conf.sh $1
$DIR/create-socket-conf.sh $1 $location
ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/$1
$DIR/create-django-directory.sh $1 $location $2
$DIR/create-django-gunicorn-booter.sh $1 $location