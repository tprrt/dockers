FROM debian:unstable-slim
LABEL maintainer thomas.perrot@tupi.fr

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y --no-install-recommends \
        bash \
        bc \
        binutils \
        build-essential \
        bzip2 \
        ca-certificates \
        cpio \
        dumb-init \
        file \
        gcc-9 \
        git \
        gzip \
        g++-9 \
        libncurses5-dev \
        libncursesw5-dev \
        make \
        patch \
        perl \
	python3 \
        rsync \
        sed \
        tar \
        unzip \
        wget \
    && apt-get autoclean \
    && apt-get autoremove --purge \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 20 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 20 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10 \
    && echo -n "Europe/Paris" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata

RUN useradd -m devuser

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
