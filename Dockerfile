FROM debian:jessie
MAINTAINER Alexander Trost <galexrt@googlemail.com>

ENV PEN_VERSION="0.30.1"

RUN apt-get update && \
    apt-get install -yq wget tar gcc build-base && \
    wget "http://siag.nu/pub/pen/pen-$PEN_VERSION.tar.gz" -P / && \
    tar xfz "/pen-$PEN_VERSION.tar.gz" -C / && \
    rm -f "/pem-$PEN_VERSION.tar.gz" && \
    cd "/pen-$PEN_VERSION" && \
    ./configure && \
    make && \
    make install && \
    apt-get --purge remove -yq wget tar build-base gcc && \
    apt-get --purge autoremove -yq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/local/bin/pen", "-f"]
