#!/bin/bash

if (( $EUID != 0 )); then
    echo "I only take orders from superusers - use sudo"
    exit
fi
if [[ $# -eq 0 ]] ; then
    echo 'Need website name'
    exit 0
fi

location=$HOME

if [[ $# -eq 2 ]] ; then
    location=$2
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$DIR/create-certificate.sh $1
$DIR/create-ssl-conf.sh $1
$DIR/create-static-conf.sh $1 $location
ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/$1
$DIR/create-static-directory.sh $1 $location