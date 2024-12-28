==================
ngdevkit container
==================

A container to build and to test Neo-Geo AES or MVS applications with
`ngdevkit`_, an open source devkit.

It also provides a few additional packages to be able to build `ngdevkit`_
examples and to run them with the emulator.

----

Use the following command to pull the image of this container:

.. code-block:: bash

    podman pull docker.io/tprrt/ubuntu-ngdevkit


Otherwise, it is possible to build the image, with the command below:

.. code-block:: bash

    podman build -t tprrt/ubuntu-ngdevkit:latest -f ./Dockerfile .


Run the container:

.. code-block:: bash

    xhost +"local:podman@"

    cd <src>
    podman run --rm -i -t \
        --security-opt seccomp=unconfined --security-opt label=disable \
        --userns=keep-id:uid=1000,gid=1000 \
        --mount type=bind,source=$(pwd),target=/src \
        --workdir /src \
	-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
        --pids-limit=0 \
        tprrt/ubuntu-ngdevkit


Stop the container:

.. code-block:: bash

    podman container stop -t=1 tprrt/ubuntu-ngdevkit
    podman container rm tprrt/ubuntu-ngdevkit
    xhost -"local:podman@


.. _ngdevkit: https://github.com/dciabrin/ngdevkit
.. _ngdevkit-examples: https://github.com/dciabrin/ngdevkit-examples
