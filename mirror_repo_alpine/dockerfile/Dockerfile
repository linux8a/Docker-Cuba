FROM nginx:stable-alpine
LABEL org.opencontainers.image.title="Mirror alpine" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="Mirror repo alpine" \
      org.opencontainers.image.licenses="GPL v2.0"

RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add rsync

COPY cron_mirror /etc/cron.d/cron_mirror
COPY ./rsync.sh /bin/rsync_mirror.sh
COPY  ./exclude.txt /etc/rsync/exclude.txt
COPY nginx.conf /etc/nginx/nginx.conf
RUN chmod +x /bin/rsync_mirror.sh &&\
    chmod 0644 /etc/cron.d/cron_mirror &&\
    crontab /etc/cron.d/cron_mirror

VOLUME  /html

EXPOSE 80 443
CMD [ "ash", "-c", "crond && nginx -g 'daemon off;'" ]