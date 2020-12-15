FROM python:alpine

LABEL org.opencontainers.image.title="Udemy Download" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="Donwload Udemy" \
      org.opencontainers.image.licenses="GPL v2.0"

ENV URL=
ENV USERNAME=
ENV PASSWORD=
ENV ARGS=

RUN apk update && apk upgrade \
    && apk add --no-cache git curl build-base libffi-dev openssl-dev \
    && pip3 install --upgrade pip

# Download git and install requirement

RUN cd /usr/src/ \
    && git clone https://github.com/r0oth3x49/udemy-dl/ \
    && cd udemy-dl \
    && pip install -r requirements.txt

RUN mkdir /data

VOLUME /data
WORKDIR /data

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]