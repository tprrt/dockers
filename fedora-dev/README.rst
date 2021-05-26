============================
Fedora development container
============================

A container providing a minimal set of tools to develop an application for
`Fedora`_ 33.

----

Use the following command to pull the image of on of these container:

.. code-block:: bash

    podman pull docker.io/tprrt/fedora-dev


Otherwise, it is possible to build the image, with the command below:

.. code-block:: bash

    podman build -t tprrt/fedora-dev:latest -f ./Dockerfile .


Run the container:

.. code-block:: bash

    cd <src>
    podman run --rm -i -t \
        --security-opt seccomp=unconfined --security-opt label=disable \
        --userns=keep-id \
        --mount type=bind,source=$(pwd),target=/src \
        --workdir /src \
        tprrt/fedora-dev


Stop the container:

.. code-block:: bash

    podman container stop -t=1 tprrt/fedora-dev
    podman container rm tprrt/fedora-dev


.. _Fedora: https://getfedora.org
