FROM alpine:edge
LABEL org.opencontainers.image.title="tcpdump" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="tcpdump" \
      org.opencontainers.image.licenses="GPL v2.0"

RUN apk update && apk upgrade \
    && apk add tcpdump
RUN mkdir /data
WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT ["/usr/sbin/tcpdump"]


