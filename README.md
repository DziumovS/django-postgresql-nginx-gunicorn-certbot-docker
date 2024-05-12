# Django application using PostgreSQL, Nginx, Certbot, Memcached in Docker containers.

### Setting up your work environment.
To work with this repository, you will need:

1. Git
2. Docker
3. Docker-compose
4. Ssh
5. Any text redactor 

### To get started, you need:
1. Clone this repository:
  ```bash
  git clone git@github.com:DziumovS/django-postgresql-nginx-gunicorn-certbot-docker.git
  ```
2. Move to directory with app:
  ```bash
  cd django-postgresql-nginx-gunicorn-certbot-docker
  ```
3. Open .env_public, enter a DOMAIN name and your EMAIL, save file as an .env
4. Run in app-root directory (django-postgresql-nginx-gunicorn-certbot-docker/) command:
  ```bash
  chmod +x run_app.sh
  ```
6. And then run command:
  ```bash
  ./run_app.sh
  ```
7. After that, go into the app container, to /app/test_app/ path and run the command:
  ```bash
  ./manage.py createsuperuser
  ```

---
The `./run_app.sh` command does the following:
- Builds images of all services according to each service's <b>Dockerfile</b>.
- Raises the containers.
- When all containers are up, in particular the container with <b>Nginx</b> starts responding - runs `install-certs.sh` script, which with the help of <b>Certbot</b> generates SSL certificates for the domain specified in the '.env' file via <b>Let's Encrypt</b>.
- If successful - all containers are restarted.
- When the containers are up again - a task will be added to <b>crontab</b>: run the `update_certs.sh` script every second month of the year - this script renews SSL certificates.
---

Of the features:
- Pay attention to the script in `docker/proxy/run.sh` - where 5 variables are set via shielding. It is necessary for them to be correctly perceived in the `docker/proxy/nginx/default-ssl.conf.tpl` file and to be perceived in principle.
- Also in the file `docker/proxy/nginx/default-ssl.conf.tpl` in <b>proxy_pass</b> the `name of the service` (exactly the <b>service</b>) from `docker-compose.yml` is specified, and the <b>default port</b> on which the application is running.
