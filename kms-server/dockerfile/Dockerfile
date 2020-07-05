FROM alpine:latest
LABEL org.opencontainers.image.title="Kms server" \
      org.opencontainers.image.description="Kms Server" \
      org.opencontainers.image.licenses="GPL v2.0"

RUN mkdir /app

WORKDIR /app

ADD . /app

RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
                                build-base && \
    cd vlmcsd && \
    make && \
    mv vlmcsd /usr/bin && \
    apk del .build-deps build-base && \
    rm -rf /tmp/* && \
    rm -rf /app/*

EXPOSE 1688

CMD ["/usr/bin/vlmcsd", "-f"]
