FROM python:3-alpine
LABEL org.opencontainers.image.title="webssh" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="webssh" \
      org.opencontainers.image.licenses="GPL v2.0"

RUN apk add build-base libffi-dev openssl-dev openssh-client \
    && python3 -m pip install --upgrade pip \
    && pip3 install webssh \
    && rm -rf /root/.cache/*
EXPOSE 8080
CMD ["wssh", "--address=0.0.0.0", "--port=8080"]