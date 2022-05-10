FROM alpine:latest as build

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

FROM scratch
LABEL org.opencontainers.image.title="Kms server" \
      org.opencontainers.image.description="Kms Server" \
      org.opencontainers.image.licenses="GPL v2.0"
COPY --from=build /lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
COPY --from=build /usr/bin/vlmcsd ./vlmcsd
EXPOSE 1688

CMD ["./vlmcsd", "-f"]