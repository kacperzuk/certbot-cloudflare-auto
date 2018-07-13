#!/bin/bash

set -x

umask 077
cat > /etc/cloudflare_credentials.ini <<EOF
dns_cloudflare_email = $EMAIL
dns_cloudflare_api_key = $API_KEY
EOF

while true; do
    date
    certbot "$@"
    sleep 24h
done
