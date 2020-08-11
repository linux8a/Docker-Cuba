#
# Spiderfoot Dockerfile
#
# http://www.spiderfoot.net

# Pull the base image.
FROM alpine:3.9.6

WORKDIR /home/spiderfoot

# Place database and configs outside installation directory
ENV SPIDERFOOT_DATA /var/lib/spiderfoot

COPY requirements.txt .

# Run everything as one command so that only one layer is created
RUN apk --update add --no-cache --virtual build-dependencies gcc git curl py3-pip swig \
        tinyxml-dev python3-dev musl-dev openssl-dev libffi-dev libxslt-dev \
    && apk --update --no-cache add python3 musl openssl libxslt tinyxml jpeg-dev openjpeg-dev zlib-dev \
    && pip3 install --upgrade pip \
    && pip3 --no-cache-dir install wheel \
    && pip3 --no-cache-dir install -r requirements.txt \
    && addgroup spiderfoot \
    && adduser -G spiderfoot -h /home/spiderfoot -s /sbin/nologin \
               -g "SpiderFoot User" -D spiderfoot \
    && apk del --purge build-dependencies \
    && rm -rf /var/cache/apk/* \
    && rm -rf /lib/apk/db \
    && rm -rf /root/.cache \
    && mkdir $SPIDERFOOT_DATA \
    && chown spiderfoot:spiderfoot /var/lib/spiderfoot

USER spiderfoot

EXPOSE 5001

# Run the application.
ENTRYPOINT ["/usr/bin/python3"] 
CMD ["sf.py", "-l", "0.0.0.0:5001"]

COPY . .
