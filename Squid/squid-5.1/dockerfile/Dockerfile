FROM alpine:edge
LABEL org.opencontainers.image.title="Squid Proxy" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="Squid Proxy 5.1" \
      org.opencontainers.image.licenses="GPL v2.0"

RUN apk update \
   && apk add squid curl bash which openssl ca-certificates \
   && rm -rf /var/cache/apk/*
   
   COPY start-squid.sh /usr/local/bin/
   RUN chmod 755 /usr/local/bin/start-squid.sh
   EXPOSE 3128/tcp
   ENTRYPOINT ["/usr/local/bin/start-squid.sh"]