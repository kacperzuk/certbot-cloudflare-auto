#!/bin/bash

set -x
while true; do
    date
    certbot "$@"
    sleep 24h
done
