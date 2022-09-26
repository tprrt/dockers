FROM debian:unstable-slim
LABEL maintainer thomas.perrot@tupi.fr

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y --no-install-recommends \
        bash \
        bc \
        bison \
        build-essential \
        ca-certificates \
        cpio \
        device-tree-compiler \
        dumb-init \
        file \
        flex \
        gcc-9 \
        g++-9 \
        ipxe-qemu \
        libncurses5-dev \
        libncursesw5-dev \
        libsdl2-dev \
        libssl-dev \
        locales \
        lzop \
        python3-pycryptodome \
        python3-dev \
        python3-pytest \
        qemu-system-aarch64 \
        qemu-system-arm \
        qemu-system-riscv64 \
        qemu-user \
        qemu-user-static \
        strace \
        swig \
        wget \
    && apt-get autoclean \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 20 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 10 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 20 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 10 \
    && echo -n "UTC" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get purge locales-all \
    && dpkg-reconfigure -f noninteractive locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && echo "en_US.UTF-8 UTF-8" > /etc/default/locale \
    && locale-gen en_US.UTF-8 \
    && update-locale

RUN wget https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2022.08-1.tar.bz2 \
    && tar xvjf aarch64--glibc--stable-2022.08-1.tar.bz2 \
    && rm -f aarch64--glibc--stable-2022.08-1.tar.bz2

RUN wget https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2022.08-1.tar.bz2 \
    && tar xvjf armv7-eabihf--glibc--stable-2022.08-1.tar.bz2 \
    && rm -f armv7-eabihf--glibc--stable-2022.08-1.tar.bz2

RUN wget https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2022.08-1.tar.bz2 \
    && tar xvjf riscv64-lp64d--glibc--stable-2022.08-1.tar.bz2 \
    && rm -f riscv64-lp64d--glibc--stable-2022.08-1.tar.bz2

RUN useradd -m devuser

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
