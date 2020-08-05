FROM alpine:3.12

RUN apk --update --no-cache add kmod binutils grep perl

COPY . /check

ENTRYPOINT ["/check/spectre-meltdown-checker.sh"]
