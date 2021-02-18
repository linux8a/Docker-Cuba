FROM python

LABEL org.opencontainers.image.title="Megaudemy-dl" \
      org.opencontainers.image.authors="Argenis Ochoa Gonzalez <linux8a@gmail.com>" \
      org.opencontainers.image.description="Para descargar Cursos de Udemy y subirlo a Mega" \
      org.opencontainers.image.licenses="GPL v2.0"

ENV URL=
ENV USERNAME=
ENV PASSWORD=
ENV MAILMEGA=
ENV PASSWORDMEGA=
ENV SIZEVOLUME=
ENV ARGS=

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y \
    && apt-get install -y git curl megatools --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* 

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
