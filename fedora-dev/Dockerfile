FROM fedora:42

LABEL maintainer="Thomas Perrot thomas.perrot@tupi.fr"

RUN dnf -y update --refresh \
    && dnf -y install --setopt=install_weak_deps=False --best \
        @development-tools \
        automake \
        bzip2-devel \
        ca-certificates \
        cmake \
        dumb-init \
        fedora-packager \
        fedora-review \
        g++ \
        libtool \
        libusb-compat-0.1-devel \
        libzip-devel \
        openssl-devel \
    && dnf -y autoremove \
    && dnf -y clean all --enablerepo=\* \
    && rm -rf /var/cache/dnf

RUN useradd -m devuser
RUN usermod -a -G mock devuser

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
