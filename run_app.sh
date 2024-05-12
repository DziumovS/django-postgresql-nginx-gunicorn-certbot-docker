#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

docker compose -f docker-compose.yml run --rm certbot /opt/install-certs.sh

echo "Certificates are created, now we do a restart of the containers to get the application to start working!"

sleep 20

docker compose down

echo "The containers have been successfully stopped"

sleep 5

docker compose up -d

echo "Containers successfully started!"

sleep 3

chmod +x update_certs.sh

if ! crontab -l | grep -q "update_certs.sh"; then
    (crontab -l ; echo "0 0 1 */2 * $SCRIPT_DIR/update_certs.sh") | crontab -
fi

echo "The certificates are scheduled to be renewed"
