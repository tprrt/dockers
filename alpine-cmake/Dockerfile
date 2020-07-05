FROM alpine:3.12

LABEL maintainer thomas.perrot@tupi.fr

# To install packages required
# -----------------------------------------------------------------------------

RUN apk add --no-cache --update bash cmake cmake clang clang-dev make gcc g++ gdb libc-dev linux-headers shadow \
    && rm -rf /var/cache/apk/*

# Copy the entrypoint script
# ----------------------------------------------------------------------------

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "/bin/bash"]
