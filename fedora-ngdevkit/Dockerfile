# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2020-2026 Thomas Perrot <thomas.perrot@tupi.fr>

FROM fedora:42

LABEL maintainer="Thomas Perrot thomas.perrot@tupi.fr"

RUN dnf -y update --refresh \
    && dnf -y install --setopt=install_weak_deps=False --best \
        dnf-plugins-core \
    && dnf -y copr enable dciabrin/ngdevkit \
    && dnf -y update --refresh \
    && dnf -y install --setopt=install_weak_deps=False --best \
        autoconf \
        automake \
        bash \
        dumb-init \
        glibc-langpack-en \
        ImageMagick \
        make \
        ngdevkit \
        ngdevkit-gngeo \
        pkgconfig \
        python3-pygame \
        rsync \
        sox \
        which \
        zip \
    && dnf -y autoremove \
    && dnf -y clean all --enablerepo=\* \
    && rm -rf /var/cache/dnf \
    && ln -sf /usr/share/zoneinfo/UTC /etc/localtime

RUN useradd -m devuser

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
