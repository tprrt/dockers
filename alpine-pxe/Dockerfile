# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2020-2026 Thomas Perrot <thomas.perrot@tupi.fr>

FROM alpine:3.12

LABEL maintainer="Thomas Perrot thomas.perrot@tupi.fr"

RUN apk add --no-cache --update \
    bash \
    dnsmasq \
    iptables  \
    syslinux \
    tar \
    wget \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /tftp/pxelinux.cfg \
    && cp /usr/share/syslinux/pxelinux.0 /tftp/pxelinux.0 \
    && cp /usr/share/syslinux/ldlinux.c32 /tftp/ldlinux.c32

RUN apkArch="$(apk --print-arch)" ; \
    wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_${apkArch} \
    && chmod +x /usr/local/bin/dumb-init

COPY pxelinux.sh /usr/local/bin/pxelinux.sh
RUN chmod +x /usr/local/bin/pxelinux.sh

# DHCP
EXPOSE 67/udp
# BOOTP
EXPOSE 68/udp
# TFTP
EXPOSE 69/udp
# PXE
EXPOSE 4011/udp

WORKDIR /tftp

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["pxelinux.sh"]
