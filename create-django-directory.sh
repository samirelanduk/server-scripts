#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Need website name'
    exit 0
fi
if [[ $# -eq 1 ]] ; then
    echo 'Need website directory'
    exit 0
fi
if [[ $# -eq 2 ]] ; then
    echo 'Need Python version'
    exit 0
fi

mkdir $2/$1
mkdir $2/$1/source
mkdir $2/$1/static
mkdir $2/$1/uploads

virtualenv -p $3 $2/$1/env
$2/$1/env/bin/pip install gunicorn

chown -R $(logname) $2/$1
chgrp -R $(logname) $2/$1

