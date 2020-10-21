FROM alpine:edge

RUN apk --no-cache add \
        apache2-ssl \
        apache2-utils \
        ca-certificates \
        htop

ENTRYPOINT [ "ab" ]