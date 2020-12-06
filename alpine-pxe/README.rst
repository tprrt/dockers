PXE/TFTP server
---------------

A `PXE`_/`TFTP`_ server to boot a target from the network.

::

    podman build -t tprrt/alpine-pxe:latest -f ./Dockerfile .

    # Launch the container
    cd <pxelinux.cfg>
    podman run --rm -i -t --cap-add=NET_ADMIN,NET_RAW --mount type=bind,source=$(pwd),target=/tftp/pxelinux.cfg tprrt/alpine-pxe

    # Stop the container
    podman container stop -t=1 tprrt/alpine-pxe
    podman container rm tprrt/alpine-pxe

Following an example for /tftp/pxelinux.cfg/default:

::

    PROMPT 0
    TIMEOUT 3
    DEFAULT install
    LABEL install
    LINUX vmlinuz
    INITRD image
    APPEND ip=dhcp panic=1 rootdelay=10 root=/dev/mmcblk0


.. _PXE: https://en.wikipedia.org/wiki/Preboot_Execution_Environment
.. _TFTP: https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol
