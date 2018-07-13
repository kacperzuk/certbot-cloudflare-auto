certbot-cloudflare-auto
=================

Docker image for automatic certificate renewal using certbot with bundled dns-cloudflare plugin. Provide a command and it will be run daily. Example usage:

```
cat > cloudflare_credentials.ini << EOF
dns_cloudflare_email = YOUR@EMAIL
dns_cloudflare_api_key = YOUR_CLOUDFLARE_API_KEY
EOF

docker run -d -v $(pwd)/cloudflare_credentials.ini:/etc/letsencrypt/cloudflare_credentials.ini -v letsencrypt-etc:/etc/letsencrypt -v letsencrypt-lib:/var/lib/letsencrypt kacperzuk/certbot-cloudflare-auto certonly -d YOUR_DOMAIN -m YOUR@EMAIL --dns-cloudflare --dns-cloudflare-credentials=/etc/letsencrypt/cloudflare_credentials.ini -n --restart always
```
