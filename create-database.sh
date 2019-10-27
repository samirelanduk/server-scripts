#!/bin/bash

if (( $EUID != 0 )); then
    echo "I only take orders from superusers - use sudo"
    exit
fi

if [[ $# -eq 0 ]] ; then
    echo 'Need database name'
    exit 0
fi

if [[ $# -eq 1 ]] ; then
    echo 'Need database password'
    exit 0
fi

sudo -u postgres -H sh -c "psql -c \"CREATE USER \\\"$1\\\" WITH PASSWORD '$2';\""
sudo -u postgres -H sh -c "createdb $1"