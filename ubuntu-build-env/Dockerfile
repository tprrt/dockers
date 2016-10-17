FROM ubuntu:15.10

RUN apt-get update

# To install packages required to enable the connectivity
# ----------------------------------------------------------------------------
RUN apt-get install -y --no-install-recommends iproute2 iputils-ping openssh-client git

# To install packages required to build Yocto
# ----------------------------------------------------------------------------
RUN apt-get install -y --no-install-recommends file cpio gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat python2.7

# To install packages required to build Exiguous images
# ----------------------------------------------------------------------------
RUN apt-get install -y --no-install-recommends python3 cryptsetup

# To install packages required to reduce the build's time
# ----------------------------------------------------------------------------
RUN apt-get install -y --no-install-recommends ccache prelink preload
RUN prelink -amvR

# To install repo
# ----------------------------------------------------------------------------
RUN ln -s /usr/bin/python2.7 /usr/bin/python
RUN ln -s /usr/bin/python2.7 /usr/bin/python2
RUN wget http://commondatastorage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
RUN chmod a+x /usr/local/bin/repo

# Set the timezone
# ----------------------------------------------------------------------------
RUN echo -n "Europe/Paris" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Clean up APT when done.
# ----------------------------------------------------------------------------
RUN apt-get autoclean && apt-get autoremove --purge && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy the entrypoint script
# ----------------------------------------------------------------------------
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

