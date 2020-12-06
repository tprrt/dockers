OpenEmbedded container
----------------------

A container to build a complete Linux system with the`OpenEmbedded`_ framework.

::

    podman build -t tprrt/debian-oe:latest -f ./Dockerfile .

    # Launch the container
    cd <src>
    podman run --rm -i -t --security-opt seccomp=unconfined --security-opt label=disable --userns=keep-id --mount type=bind,source=$(pwd),target=/src --workdir /src tprrt/debian-oe

    # Stop the container
    podman container stop -t=1 tprrt/debian-oe
    podman container rm tprrt/debian-oe

.. _OpenEmbedded: https://openembedded.org
