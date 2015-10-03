FROM debian:jessie
MAINTAINER Alexander Trost <galexrt@googlemail.com>

ENV PEN_VERSION="0.30.1"

RUN apt-get update && \
    apt-get install -yq wget gcc build-essential && \
    wget "http://siag.nu/pub/pen/pen-$PEN_VERSION.tar.gz" -P /tmp && \
    tar xfz "/tmp/pen-$PEN_VERSION.tar.gz" -C /tmp && \
    cd "/pen-$PEN_VERSION" && \
    ./configure && \
    make && \
    make install && \
    apt-get --purge remove -yq wget tar build-base gcc tar && \
    apt-get --purge autoremove -yq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/local/bin/pen", "-f"]
