PXE/TFTP server
---------------

A PXE/TFTP server to boot a target from the network.

::

    podman build -t alpine-pxe:latest -f ./Dockerfile .

    # Launch the container
    cd <pxelinux.cfg>
    podman run --rm -i -t --cap-add=NET_ADMIN,NET_RAW --mount type=bind,source=$(pwd),target=/tftp/pxelinux.cfg alpine-pxe

    # Stop the container
    podman container stop -t=1 alpine-pxe
    podman container rm alpine-pxe

Following an example for /tftp/pxelinux.cfg/default:

::

    PROMPT 0
    TIMEOUT 3
    DEFAULT install
    LABEL install
    LINUX vmlinuz
    INITRD image
    APPEND ip=dhcp panic=1 rootdelay=10 root=/dev/mmcblk0
