FROM lsiobase/alpine:3.18
LABEL maintainer="Sam Burney <sam@burney.io>"

RUN apk add --update openvpn iptables bash frr && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

RUN cp -r /etc/frr /usr/lib/frr/default

COPY /docker/root /

EXPOSE 1194/udp
VOLUME ["/etc/openvpn"]