#!/bin/bash

if (( $EUID != 0 )); then
    echo "I only take orders from superusers - use sudo"
    exit
fi

certbot renew

nginx -t 2>/dev/null > /dev/null
if [[ $? == 0 ]]; then
    service nginx restart
fi