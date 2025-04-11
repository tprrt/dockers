FROM debian:bookworm-slim

LABEL maintainer="Thomas Perrot thomas.perrot@tupi.fr"

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        bash \
        bc \
        binutils \
        build-essential \
        bzip2 \
        ca-certificates \
        cpio \
        dumb-init \
        file \
        gcc \
        git \
        gzip \
        g++ \
        libncurses5-dev \
        libncursesw5-dev \
        locales \
        make \
        patch \
        perl \
        python3 \
        python3-six \
        rsync \
        sed \
        tar \
        tzdata \
        unzip \
        wget \
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

RUN useradd -m devuser

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
