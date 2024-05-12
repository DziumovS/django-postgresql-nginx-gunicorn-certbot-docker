server {
    listen 80;
    server_name ${DOMAIN} www.${DOMAIN};

    location /.well-known/acme-challenge/ {
        root /vol/www/;
        index home.html;
    }

    location / {
        return 301 https://$host$request_uri;
    }
}
