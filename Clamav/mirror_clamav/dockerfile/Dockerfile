FROM nginx:stable-alpine
LABEL org.opencontainers.image.title="Mirror ClamAV" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="Mirror ClamAV" \
      org.opencontainers.image.licenses="GPL v2.0"

RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add openvpn

ADD ./html /html

COPY ./mirror_clamav.sh /bin/mirror_clamav.sh
COPY cron_mirror /etc/cron.d/cron_mirror
COPY nginx.conf /etc/nginx/nginx.conf

RUN chmod +x /bin/mirror_clamav.sh &&\
    chmod 0644 /etc/cron.d/cron_mirror &&\
    crontab /etc/cron.d/cron_mirror

EXPOSE 80 443
CMD [ "ash", "-c", "crond && nginx -g 'daemon off;'" ]
