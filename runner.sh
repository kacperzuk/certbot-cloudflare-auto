#!/bin/bash

function nginx_proxy_compat {
    if [ ! -e /etc/letsencrypt/live ]; then
        return
    fi

    for dpath in /etc/letsencrypt/live/*; do
        domain=$(basename "$dpath")
        mkdir -p /etc/letsencrypt/nginx-proxy/
        if [ ! -e /etc/letsencrypt/nginx-proxy/$domain.crt ]; then
            ln -s $dpath/fullchain.pem /etc/letsencrypt/nginx-proxy/$domain.crt
        fi
        if [ ! -e /etc/letsencrypt/nginx-proxy/$domain.key ]; then
            ln -s $dpath/privkey.pem /etc/letsencrypt/nginx-proxy/$domain.key
        fi
    done
}

set -x

while true; do
    date
    certbot "$@"
    nginx_proxy_compat
    sleep 24h
done
