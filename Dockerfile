FROM gliderlabs/alpine:3.2
MAINTAINER Alexander Trost <galexrt@googlemail.com>

ENV PEN_VERSION="0.30.1"

RUN apk --update add wget tar gcc build-base && \
    wget "http://siag.nu/pub/pen/pen-$PEN_VERSION.tar.gz" -P / && \
    tar xfz "/pen-$PEN_VERSION.tar.gz" -C / && \
    rm -f "/pem-$PEN_VERSION.tar.gz" && \
    cd "/pen-$PEN_VERSION" && \
    ./configure && \
    make && \
    make install && \
    apk --purge del wget tar gcc

ENTRYPOINT ["/usr/local/bin/pen"]
