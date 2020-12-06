FROM alpine:3.12
LABEL maintainer thomas.perrot@tupi.fr

RUN apk add --no-cache --update bash build-base clang clang-dev cmake file gdb linux-headers strace \
    && rm -rf /var/cache/apk/*

RUN apkArch="$(apk --print-arch)" ; \
    wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_${apkArch} \
    && chmod +x /usr/local/bin/dumb-init

RUN useradd -m devuser

USER devuser

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/bin/bash"]
