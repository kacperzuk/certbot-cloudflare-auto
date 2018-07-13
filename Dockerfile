FROM kacperzuk/certbot-cloudflare
VOLUME /etc/letsencrypt /var/lib/letsencrypt
COPY runner.sh /
ENTRYPOINT [ "/runner.sh" ]
