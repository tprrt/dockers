Buildroot container
-------------------

A container to build a complete Linux system with the `Buildroot`_ framework.

::

    podman build -t tprrt/debian-buildroot:latest -f ./Dockerfile .

    # Launch the container
    cd <src>
    podman run --rm -i -t --security-opt seccomp=unconfined --security-opt label=disable --userns=keep-id --mount type=bind,source=$(pwd),target=/src --workdir /src tprrt/debian-buildroot

    # Stop the container
    podman container stop -t=1 tprrt/debian-buildroot
    podman container rm tprrt/debian-buildroot

.. _Buildroot: https://buildroot.org
