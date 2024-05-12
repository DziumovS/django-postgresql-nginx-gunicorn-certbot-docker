FROM python:3.11-slim-bullseye

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /app/test_app/static
RUN mkdir -p /app/test_app/media
WORKDIR /app

COPY . .

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc libpq-dev curl nano && \
    install -d /usr/share/postgresql-common/pgdg && \
    curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc && \
    sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt bullseye-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    apt-get update && \
    apt-get install -y postgresql-client-16 && \
    pip install --upgrade pip && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir --no-deps -r requirements.txt && \
    useradd -ms /bin/bash www && \
    chown -R www:www /app && \
    chmod -R 755 /app/test_app/app/migrations && \
    chmod -R 755 /app/test_app/media && \
    chmod +x /app/test_app/start_gunicorn.sh

USER www

CMD ["sh", "./test_app/start_gunicorn.sh"]
