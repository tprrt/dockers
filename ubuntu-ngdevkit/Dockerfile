FROM ubuntu:noble
LABEL maintainer thomas.perrot@tupi.fr

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository -y ppa:dciabrin/ngdevkit \
    && apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        bash \
        dumb-init \
        imagemagick \
        libsox-fmt-mp3 \
        make \
        ngdevkit \
        ngdevkit-gngeo \
        pkg-config \
        sox \
        locales \
        zip \
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

USER ubuntu

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
