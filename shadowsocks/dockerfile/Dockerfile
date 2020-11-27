FROM python:3-alpine
LABEL org.opencontainers.image.title="shadowsocks server" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="shadowsocks server" \
      org.opencontainers.image.licenses="GPL v2.0"

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV PASSWORD=
ENV METHOD      aes-256-cfb
ENV IPEXTERNA=
ENV TIMEOUT     300
ENV TZ UTC
ENV ARGS=

RUN apk add build-base libffi-dev openssl libqrencode \
    && python3 -m pip install --upgrade pip \
    && pip install shadowsocks \
    && rm -rf /root/.cache/*i \
    && rm -rf /tmp/* \
# Solution fix in shadowsocks
# reference https://www.yangyang.cloud/blog/2020/09/23/solved-shadowsocks-undefined-symbol/
    && sed -i 's/EVP_CIPHER_CTX_cleanup/EVP_CIPHER_CTX_reset/g' /usr/local/lib/python3.9/site-packages/shadowsocks/crypto/openssl.py


EXPOSE 8388

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]
