FROM debian:unstable-slim
LABEL maintainer thomas.perrot@tupi.fr

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y --no-install-recommends \
        bash \
        bc \
        build-essential \
        ca-certificates \
        cpio \
        dumb-init \
        file \
        flex \
        gcc-9 \
        g++-9 \
        ipxe-qemu \
        libncurses5-dev \
        libncursesw5-dev \
        libssl-dev \
        locales \
        lzop \
        qemu \
        qemu-system-aarch64 \
        qemu-system-arm \
        qemu-system-riscv64 \
        qemu-user-static \
        strace \
        wget \
    && apt-get autoclean \
    && apt-get autoremove --purge \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 20 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 20 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10 \
    && echo -n "Europe/Paris" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get purge locales-all \
    && dpkg-reconfigure -f noninteractive locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && echo "en_US.UTF-8 UTF-8" > /etc/default/locale \
    && locale-gen en_US.UTF-8 \
    && update-locale

RUN wget https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2020.08-1.tar.bz2 \
    && tar xvjf aarch64--glibc--stable-2020.08-1.tar.bz2 \
    && rm -f aarch64--glibc--stable-2020.08-1.tar.bz2

RUN wget https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2020.08-1.tar.bz2 \
    && tar xvjf armv7-eabihf--glibc--stable-2020.08-1.tar.bz2 \
    && rm -f armv7-eabihf--glibc--stable-2020.08-1.tar.bz2

RUN wget https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64/tarballs/riscv64--glibc--bleeding-edge-2020.08-1.tar.bz2 \
    && tar xvjf riscv64--glibc--bleeding-edge-2020.08-1.tar.bz2 \
    && rm -f riscv64--glibc--bleeding-edge-2020.08-1.tar.bz2

RUN useradd -m devuser

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
