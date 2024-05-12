import multiprocessing
from os import environ


command = "/usr/local/bin/python"
pythonpath = "/app/test_app"
bind = "0.0.0.0:" + environ.get("APP_PORT", '8000')
user = "www"
workers = multiprocessing.cpu_count() * 2 + 1
max_requests = 1000
raw_env = "DJANGO_SETTINGS_MODULE=test_app.settings"
