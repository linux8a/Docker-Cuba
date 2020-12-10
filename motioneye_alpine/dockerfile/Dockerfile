FROM alpine:3.10

LABEL org.opencontainers.image.title="Motioneye" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="Server Motioneye" \
      org.opencontainers.image.licenses="GPL v2.0"

RUN apk update && apk upgrade

# nedd pycurl
RUN env PYCURL_SSL_LIBRARY=openssl 

RUN apk add --no-cache python py-pip build-base curl-dev curl jpeg-dev libcurl python2-dev v4l-utils \
       && pip install motioneye

RUN mkdir -p /etc/motioneye
RUN mkdir -p /var/lib/motioneye 
COPY motioneye.conf.sample /etc/motioneye/motioneye.conf

# R/W needed for motioneye to update configurations
VOLUME /etc/motioneye

# Video & images
VOLUME /var/lib/motioneye

EXPOSE 8765

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
