FROM nginx:stable-alpine

LABEL description="Running nginx as a non-root user" \
      maintainer="Dmitry Ershov <dev@ledv.org>"

RUN chown -R nginx:nginx /var/cache/nginx /var/log/nginx

COPY nginx /etc/nginx
USER nginx
WORKDIR /usr/share/nginx/html
EXPOSE 8000
