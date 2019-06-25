#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Need website name'
    exit 0
fi
if [[ $# -eq 1 ]] ; then
    echo 'Need website directory'
    exit 0
fi

cat > /etc/systemd/system/$1.service <<- EOM
[Unit]
Description=Gunicorn server for $1

[Service]
Restart=on-failure
User=$(logname)
WorkingDirectory=$2/$1/source
ExecStart=$2/$1/env/bin/gunicorn \
--bind unix:/tmp/$1.socket \
core.wsgi:application

[Install]
WantedBy=multi-user.target
EOM

systemctl daemon-reload
systemctl enable $1.service
systemctl start $1.service