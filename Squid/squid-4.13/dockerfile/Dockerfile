FROM alpine:3.11
LABEL maintainer="linux8a@gmail.com"

RUN apk update \
   && apk upgrade \
   && apk add squid curl bash which \
   && rm -rf /var/cache/apk/*
   
   COPY start-squid.sh /usr/local/bin/
   RUN chmod +x /usr/local/bin/start-squid.sh
   EXPOSE 3128/tcp
   ENTRYPOINT ["/usr/local/bin/start-squid.sh"]
