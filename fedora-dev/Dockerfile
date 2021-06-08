FROM fedora:33
LABEL maintainer thomas.perrot@tupi.fr

RUN dnf -y update --refresh \
    && dnf -y install --setopt=install_weak_deps=False --best \
        @development-tools \
        bzip2-devel \
        ca-certificates \
        cmake \
        dumb-init \
        g++ \
        libusb-devel \
        libzip-devel \
        openssl-devel \
    && dnf -y autoremove \
    && dnf -y clean all --enablerepo=\* \
    && rm -rf /var/cache/dnf

RUN useradd -m devuser

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
