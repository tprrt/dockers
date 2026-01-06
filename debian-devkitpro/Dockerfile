# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2020-2026 Thomas Perrot <thomas.perrot@tupi.fr>

FROM debian:trixie-slim AS debian-devkitpro-toolchain

LABEL maintainer="Thomas Perrot thomas.perrot@tupi.fr"

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        apt-utils \
	bash \
	bzip2 \
        ca-certificates \
	curl \
	doxygen \
        dumb-init \
        git \
	git-restore-mtime \
	gnupg \
        rsync \
        cmake zip unzip ninja-build \
	libarchive-tools \
        locales \
	make \
        patch \
	pkg-config \
        python3 \
	python-is-python3 \
	python3-lz4 \
	wget \
	xz-utils \
    && apt-get -y autoremove --purge \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo -n "UTC" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get -y purge locales-all \
    && dpkg-reconfigure -f noninteractive locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && echo "en_US.UTF-8 UTF-8" > /etc/default/locale \
    && locale-gen en_US.UTF-8 \
    && update-locale

RUN ln -s /proc/mounts /etc/mtab \
    && wget --secure-protocol=TLSv1_2 --max-redirect=0 -q \
        https://apt.devkitpro.org/install-devkitpro-pacman -O ./install-devkitpro-pacman \
    && chmod +x ./install-devkitpro-pacman \
    && ./install-devkitpro-pacman \
    && rm ./install-devkitpro-pacman \
    && dkp-pacman -Syyu --noconfirm \
    && dkp-pacman -S --needed --noconfirm dkp-toolchain-vars dkp-meson-scripts \
    && yes | dkp-pacman -Scc

ENV DEVKITPRO=/opt/devkitpro
ENV PATH=${DEVKITPRO}/tools/bin:$PATH

FROM debian-devkitpro-toolchain AS debian-devkitpro-arm64

RUN dkp-pacman -Syyu --noconfirm \
    && dkp-pacman -S --needed --noconfirm switch-dev \
    && dkp-pacman -S --needed --noconfirm switch-portlibs \
    && dkp-pacman -S --needed --noconfirm devkitARM \
    && dkp-pacman -S --needed --noconfirm dkp-toolchain-vars hactool \
    && yes | dkp-pacman -Scc

ENV DEVKITARM=${DEVKITPRO}/devkitARM

RUN useradd -m devuser \
    && echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]

FROM debian-devkitpro-toolchain AS debian-devkitpro-arm

RUN dkp-pacman -Syyu --noconfirm \
    && dkp-pacman -S --needed --noconfirm 3ds-dev nds-dev gp32-dev gba-dev gp2x-dev \
    && dkp-pacman -S --needed --noconfirm 3ds-portlibs nds-portlibs armv4t-portlibs \
    && yes | dkp-pacman -Scc

ENV DEVKITARM=${DEVKITPRO}/devkitARM

RUN useradd -m devuser \
    && echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]

FROM debian-devkitpro-toolchain AS debian-devkitpro-ppc

RUN dkp-pacman -Syyu --noconfirm gamecube-dev wii-dev wiiu-dev \
    && dkp-pacman -S --needed --noconfirm ppc-portlibs gamecube-portlibs wii-portlibs wiiu-portlibs \
    && dkp-pacman -S --needed --noconfirm devkitARM \
    && yes | dkp-pacman -Scc

ENV DEVKITPPC=${DEVKITPRO}/devkitPPC
ENV DEVKITARM=${DEVKITPRO}/devkitARM

RUN useradd -m devuser \
    && echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
