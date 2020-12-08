FROM debian:buster-slim
LABEL maintainer thomas.perrot@tupi.fr

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y --no-install-recommends \
        bash \
        build-essential \
        chrpath \
        ca-certificates \
        cpio \
        debianutils \
        diffstat \
        dumb-init \
        file \
        gawk \
        gcc-multilib \
        git \
        iproute2 \
        iputils-ping \
        libegl1-mesa \
        libsdl1.2-dev \
        locales \
        pylint3 \
        python3 \
        python3-git \
        python3-jinja2 \
        python3-pip \
        python3-pexpect \
        python3-subunit \
        python3-testtools \
        socat \
        sudo \
        texinfo \
        tzdata \
        unzip \
        wget \
        xz-utils \
    && apt-get autoclean \
    && apt-get autoremove --purge \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo -n "Europe/Paris" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get purge locales-all \
    && dpkg-reconfigure -f noninteractive locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && echo "en_US.UTF-8 UTF-8" > /etc/default/locale \
    && locale-gen en_US.UTF-8 \
    && update-locale

RUN useradd -m devuser \
    && echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
