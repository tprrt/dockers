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
	ipxe-qemu \
	libncurses5-dev \
	libncursesw5-dev \
	libssl-dev \
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
    && echo -n "Europe/Paris" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata


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
