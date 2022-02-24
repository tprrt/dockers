===================
Buildroot container
===================

A container to build a complete Linux system with the `Buildroot`_ framework.

----

Use the following command to pull the image of this container:

.. code-block:: bash

    podman pull docker.io/tprrt/debian-buildroot


Otherwise, it is possible to build the image, with the command below:

.. code-block:: bash

    podman build -t tprrt/debian-buildroot:latest -f ./Dockerfile .


Run the container:

.. code-block:: bash

    cd <src>
    podman run --rm -i -t \
        --security-opt seccomp=unconfined --security-opt label=disable \
        --userns=keep-id \
        --mount type=bind,source=$(pwd),target=/src \
        --workdir /src \
        tprrt/debian-buildroot


Stop the container:

.. code-block:: bash

    podman container stop -t=1 tprrt/debian-buildroot
    podman container rm tprrt/debian-buildroot


.. _Buildroot: https://buildroot.org
