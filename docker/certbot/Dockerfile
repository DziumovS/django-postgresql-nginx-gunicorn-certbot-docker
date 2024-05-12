FROM certbot/certbot:v2.10.0

COPY install-certs.sh /opt/
RUN chmod +x /opt/install-certs.sh

ENTRYPOINT []
CMD ["certbot", "renew"]
