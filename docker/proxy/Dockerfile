FROM nginx:1.25.0-alpine

COPY ./nginx/* /etc/nginx/
COPY ./run.sh /run.sh

ENV APP_HOST=application
ENV APP_PORT=8000

RUN apk add --no-cache openssl bash
RUN chmod +x /run.sh

VOLUME /vol/www

CMD ["/run.sh"]
