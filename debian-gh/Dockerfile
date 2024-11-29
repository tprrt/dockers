FROM debian:bookworm-slim AS builder
LABEL maintainer thomas.perrot@tupi.fr

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y --no-install-recommends \
        wget \
        gnupg \
        locales \
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

RUN wget --secure-protocol=TLSv1_2 --max-redirect=0 https://cli.github.com/packages/githubcli-archive-keyring.gpg | tee /usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list

FROM debian:bookworm-slim
LABEL maintainer thomas.perrot@tupi.fr

COPY --from=builder /usr/share/keyrings/githubcli-archive-keyring.gpg /usr/share/keyrings/githubcli-archive-keyring.gpg
COPY --from=builder /etc/apt/sources.list.d/github-cli.list /etc/apt/sources.list.d/github-cli.list

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y --no-install-recommends \
        bash \
        dumb-init \
        gh \
        locales \
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

RUN useradd -m devuser \
    && echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER devuser

RUN mkdir /home/devuser/.ssh \
    && echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /home/devuser/.ssh/config \
    && echo "ServerAliveInterval 5" >> /home/devuser/.ssh/config \
    && echo "UpdateHostKeys yes" >> /home/devuser/.ssh/config \
    && echo "StrictHostKeyChecking no" >> /home/devuser/.ssh/config \
    && chmod 600 /home/devuser/.ssh/config

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
