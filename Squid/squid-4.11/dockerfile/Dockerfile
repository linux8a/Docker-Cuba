FROM alpine:edge
LABEL maintainer="linux8a@gmail.com"

RUN apk update \
   && apk add squid curl bash which \
   && rm -rf /var/cache/apk/*
   
   COPY start-squid.sh /usr/local/bin/
   RUN chmod 755 /usr/local/bin/start-squid.sh
   EXPOSE 3128/tcp
   ENTRYPOINT ["/usr/local/bin/start-squid.sh"]