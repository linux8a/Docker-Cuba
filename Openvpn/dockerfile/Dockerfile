FROM alpine:latest
LABEL org.opencontainers.image.title="Openvpn server" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="VPN server" \
      org.opencontainers.image.licenses="GPL v2.0"

RUN apk update \
    && apk add openvpn openssl iptables easy-rsa
ADD ./openvpn /etc/openvpn
COPY ./docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh
EXPOSE 1194

CMD ["/usr/bin/docker-entrypoint.sh"]
