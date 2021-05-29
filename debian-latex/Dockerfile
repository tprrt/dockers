FROM debian:buster-slim
LABEL maintainer thomas.perrot@tupi.fr

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y --no-install-recommends \
        bash \
        ca-certificates \
        dia \
        dumb-init \
        inkscape \
        locales \
        make \
        python3-pygments \
        texlive-full \
        tzdata \
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

RUN useradd -m devuser

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
