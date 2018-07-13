certbot-cloudflare-auto
=================

Docker image for automatic certificate renewal using certbot with bundled dns-cloudflare plugin. Provide a command and it will be run daily. Example usage:

```
docker run -d -v $(pwd)/cloudflare_credentials.ini:/etc/letsencrypt/cloudflare_credentials.ini -v letsencrypt-etc:/etc/letsencrypt -v letsencrypt-lib:/var/lib/letsencrypt -e EMAIL=cloudflare@email -e API_KEY=cloudflare_api_key kacperzuk/certbot-cloudflare-auto certonly -d YOUR_DOMAIN -m YOUR@EMAIL --dns-cloudflare --dns-cloudflare-credentials=/etc/letsencrypt/cloudflare_credentials.ini -n --restart always
```
