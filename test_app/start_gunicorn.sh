#!/bin/bash

sleep 5

python test_app/manage.py collectstatic --no-input
python test_app/manage.py makemigrations --no-input
python test_app/manage.py migrate --no-input

exec gunicorn -c "/app/test_app/gunicorn_config.py" test_app.wsgi
