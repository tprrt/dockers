===============
PXE/TFTP server
===============

A `PXE`_/`TFTP`_ server to boot a target from the network.

----

Use the following command to pull the image of this container:

.. code-block:: bash

    podman pull docker.io/tprrt/alpine-pxe


Otherwise, it is possible to build the image, with the command below:

.. code-block:: bash

    podman build -t tprrt/alpine-pxe:latest -f ./Dockerfile .


Run the container:

.. code-block:: bash

    firewall-cmd --add-service=tftp
    firewall-cmd --add-service=dhcp
    firewall-cmd --add-port=4011/udp

    cd <pxelinux.cfg>
    podman run --rm -i -t \
        --security-opt seccomp=unconfined --security-opt label=disable \
        --userns=keep-id \
        --mount type=bind,source=$(pwd),target=/tftp/pxelinux.cfg \
        --workdir /tftp/pxelinux.cfg \
        --cap-add=NET_ADMIN  --cap-add=NET_RAW \
        --net host \
        --iterface <eth> \
        -p 69:69/udp \
        -p 4011:4011/udp \
        tprrt/alpine-pxe


Stop the container:

.. code-block:: bash

    podman container stop -t=1 tprrt/alpine-pxe
    podman container rm tprrt/alpine-pxe

    firewall-cmd --remove-service=tftp
    firewall-cmd --remove-service=dhcp
    firewall-cmd --remove-port=4011/udp


Following an example for /tftp/pxelinux.cfg/default:

.. code-block:: bash

    PROMPT 0
    TIMEOUT 3
    DEFAULT install
    LABEL install
    LINUX vmlinuz
    INITRD image
    APPEND ip=dhcp panic=1 rootdelay=10 root=/dev/mmcblk0


.. _PXE: https://en.wikipedia.org/wiki/Preboot_Execution_Environment
.. _TFTP: https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol
