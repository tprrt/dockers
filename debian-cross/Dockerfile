FROM debian:bookworm-slim
LABEL maintainer thomas.perrot@tupi.fr

ENV VERSION="stable"
ENV RELEASE="2023.08-1"

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y --no-install-recommends \
        bash \
        bc \
        bison \
        build-essential \
        ca-certificates \
        codespell \
        cpio \
        device-tree-compiler \
        dt-schema \
        dumb-init \
        file \
        flex \
        gcc \
        g++ \
        ipxe-qemu \
        libncurses5-dev \
        libncursesw5-dev \
        libsdl2-dev \
        libssl-dev \
        locales \
        lzop \
        python3-cryptography \
        python3-pycryptodome \
        python3-pyelftools \
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
    && apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo -n "UTC" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get purge locales-all \
    && dpkg-reconfigure -f noninteractive locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && echo "en_US.UTF-8 UTF-8" > /etc/default/locale \
    && locale-gen en_US.UTF-8 \
    && update-locale

RUN wget https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--${VERSION}-${RELEASE}.tar.bz2 \
        --secure-protocol=TLSv1_2 --max-redirect=0 -q  \
    && tar xjf aarch64--glibc--${VERSION}-${RELEASE}.tar.bz2 \
        --exclude="bin/python3*" \
        --exclude="include/python3*" \
        --exclude="lib/pkgconfig/python3*" \
        --exclude="lib/python3*" \
        --exclude="share/man/man1/python3*" \
    && rm -f aarch64--glibc--${VERSION}-${RELEASE}.tar.bz2

RUN wget https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--${VERSION}-${RELEASE}.tar.bz2 \
        --secure-protocol=TLSv1_2 --max-redirect=0 -q  \
    && tar xjf armv7-eabihf--glibc--${VERSION}-${RELEASE}.tar.bz2 \
        --exclude="bin/python3*" \
        --exclude="include/python3*" \
        --exclude="lib/pkgconfig/python3*" \
        --exclude="lib/python3*" \
        --exclude="share/man/man1/python3*" \
    && rm -f armv7-eabihf--glibc--${VERSION}-${RELEASE}.tar.bz2

RUN wget https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--${VERSION}-${RELEASE}.tar.bz2 \
        --secure-protocol=TLSv1_2 --max-redirect=0 -q  \
    && tar xjf riscv64-lp64d--glibc--${VERSION}-${RELEASE}.tar.bz2 \
        --exclude="bin/python3*" \
        --exclude="include/python3*" \
        --exclude="lib/pkgconfig/python3*" \
        --exclude="lib/python3*" \
        --exclude="share/man/man1/python3*" \
    && rm -f riscv64-lp64d--glibc--${VERSION}-${RELEASE}.tar.bz2

RUN useradd -m devuser

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
