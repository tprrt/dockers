FROM fedora:33
LABEL maintainer thomas.perrot@tupi.fr

RUN dnf -y update --refresh \
    && dnf -y install --setopt=install_weak_deps=False --best \
        @development-tools \
        ca-certificates \
        cmake \
        dumb-init \
    && dnf -y autoremove \
    && dnf -y clean all --enablerepo=\* \
    && rm -rf /var/cache/dnf

RUN useradd -m devuser

USER devuser

ENTRYPOINT ["dumb-init", "--"]
CMD ["/bin/bash"]
