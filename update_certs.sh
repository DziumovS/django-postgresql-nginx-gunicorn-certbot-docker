#!/bin/sh

echo "The SSL-certificate update script is running $(date)"

set -e

docker compose -f docker-compose.yml run --rm certbot certbot renew

echo "The SSL-certificate renewal script is complete $(date)"
