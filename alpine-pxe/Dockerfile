FROM alpine:3.12

LABEL maintainer thomas.perrot@tupi.fr

ENV ARCH amd64
ENV DIST stable
ENV MIRROR http://ftp.fr.debian.org

RUN apk add --no-cache --update bash dnsmasq iptables tar wget \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /tftp/pxelinux.cfg \
    && wget https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/syslinux-4.07.tar.gz -O /tmp/syslinux-4.07.tar.gz

RUN tar -C /tmp/ -xf /tmp/syslinux-4.07.tar.gz

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /tftp

CMD ["entrypoint.sh"]
