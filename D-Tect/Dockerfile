FROM alpine:3.12
LABEL org.opencontainers.image.title="Pentesting D-Tect-1" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="D-Tect" \
      org.opencontainers.image.licenses="GPL v2.0"

RUN apk update \
	&& apk add git python2 \
	&& rm -rf /var/cache/apk/*
RUN cd / \
      && git clone https://github.com/linux8a/D-TECT-1.git \
    && cd /D-TECT-1

WORKDIR  /D-TECT-1
ENTRYPOINT ["/usr/bin/python2", "/D-TECT-1/d-tect.py" ]

