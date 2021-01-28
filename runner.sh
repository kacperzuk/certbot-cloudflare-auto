#!/bin/sh

set -x

umask 077
cat > /etc/cloudflare_credentials.ini <<EOF
dns_cloudflare_api_token = $API_TOKEN
EOF

while true; do
    date
    certbot "$@"
    sleep 24h
done
