PXE server container
--------------------

The image intends at providing a PXE/TFTP server to boot a device station from
network.

::

    # Build the docker image
    docker-compose build

    # Launch the container
    docker-compose up [-d]

    # Verify the network configuration
    docker network inspect alpine-pxe-network

    # Bind the container to the host interface
    brctl addif br-<NETWORK ID> <host_device>

    # Open the build environment
    docker-compose exec alpine-pxe /bin/bash
