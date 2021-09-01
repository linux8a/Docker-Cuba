FROM nginx:stable-alpine
LABEL org.opencontainers.image.title="Mirror ClamAV" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="Mirror ClamAV" \
      org.opencontainers.image.licenses="GPL v2.0"

ADD html /html

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443
CMD [ "ash", "-c", "nginx -g 'daemon off;'" ]
