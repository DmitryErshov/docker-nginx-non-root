FROM nginx:stable-alpine

LABEL description="Running nginx as a non-root user" \
      maintainer="Dmitry Ershov <dev@ledv.org>"

RUN apk add shadow \
    && groupmod -g 1001 nginx \
    && usermod -u 1001 nginx \
    && chown -R nginx:nginx /var/cache/nginx /var/log/nginx \
    && apk del shadow

COPY nginx /etc/nginx
USER nginx
WORKDIR /app
EXPOSE 8000
