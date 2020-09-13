FROM alpine:edge
LABEL org.opencontainers.image.title="tshark" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="tshark" \
      org.opencontainers.image.licenses="GPL v2.0"

RUN apk update && apk upgrade \
    && apk add tshark
RUN mkdir /data
WORKDIR /data
VOLUME ["/data"]

#Preparint user argochoa
RUN addgroup argochoa \
    && adduser -G argochoa -s /bin/sh -D argochoa \
    && echo "argochoa:argochoa" | /usr/sbin/chpasswd \
    && echo "argochoa  ALL=(ALL ALL" >> /etc/sudoers
RUN chown -R argochoa:argochoa /home/argochoa

ENTRYPOINT ["tshark"]


