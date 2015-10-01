FROM debian:jessie
MAINTAINER Alexander Trost <galexrt@googlemail.com>

ENV PEN_VERSION="0.30.1"

RUN apt-get update && \
    apt-get upgrade -yq && \
    apt-get install -yq wget && \
    wget "http://siag.nu/pub/pen/pen-$PEN_VERSION.tar.gz" -P /root && \
    apt-get --purge remove -yq wget && \
    apt-get --purge autoremove -yq && \
    tar xfz "/root/pen-$PEN_VERSION.tar.gz" -C /root && \
    rm -f "/root/pem-$PEN_VERSION.tar.gz" && \
    cd "/root/pen-$PEN_VERSION" && \
    ./configure && \
    make && \
    make install && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/local/bin/pen"]
