FROM debian:bookworm-slim
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
        gdisk \
        git \
        iproute2 \
        iputils-ping \
        iptables \
        kas \
        less \
        libegl1-mesa \
        libsdl1.2-dev \
        locales \
        lz4 \
        procps \
        pylint \
        python3 \
        python-is-python3 \
        python3-cairo \
        python3-git \
        python3-jinja2 \
        python3-pexpect \
        python3-subunit \
        python3-testtools \
        openssh-client \
        socat \
        sudo \
        texinfo \
        tmux \
        tzdata \
        unzip \
        vim \
        wget \
        xz-utils \
        zstd \
    && apt-get autoremove --purge \
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

RUN mkdir /tmp/qemu-tap-locks && touch /tmp/qemu-tap-locks/tap0.skip

RUN useradd -m devuser \
    && echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER devuser

RUN mkdir /home/devuser/.ssh \
    && echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /home/devuser/.ssh/config \
    && echo "ServerAliveInterval 5" >> /home/devuser/.ssh/config \
    && echo "UpdateHostKeys yes" >> /home/devuser/.ssh/config \
    && echo "StrictHostKeyChecking no" >> /home/devuser/.ssh/config \
    && chmod 600 /home/devuser/.ssh/config

RUN mkdir -p /home/devuser/.local/bin/ \
    && wget https://commondatastorage.googleapis.com/git-repo-downloads/repo -O /home/devuser/.local/bin/repo \
        --secure-protocol=TLSv1_2 --max-redirect=0 -q  \
    && chmod a+rx /home/devuser/.local/bin/repo \
    && echo 'export PATH="${PATH}:/home/devuser/.local/bin"' >> /home/devuser/.bashrc

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
