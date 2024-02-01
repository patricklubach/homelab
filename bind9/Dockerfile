FROM ubuntu:22.04

RUN apt-get update && apt-get install -y bind9 bind9utils

COPY --chown=bind named.conf.options /etc/bind/named.conf.options
COPY --chown=bind named.conf.local /etc/bind/named.conf.local
COPY --chown=bind db.homelab.internal /etc/bind/db.homelab.internal

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]