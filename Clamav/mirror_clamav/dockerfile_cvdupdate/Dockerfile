FROM python:3-alpine
LABEL org.opencontainers.image.title="Download DB ClamAV" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="Download DB ClamAV" \
      org.opencontainers.image.licenses="GPL v2.0"

COPY ./mirror_clamav.sh /bin/mirror_clamav.sh
COPY cron_mirror /etc/cron.d/cron_mirror
RUN mkdir /data &&\
    chmod 0644 /etc/cron.d/cron_mirror &&\
    chmod +x /bin/mirror_clamav.sh &&\
    crontab /etc/cron.d/cron_mirror &&\
    python3 -m pip install --upgrade pip &&\
    python3 -m pip install --user cvdupdate

CMD [ "crond", "-f" ]
