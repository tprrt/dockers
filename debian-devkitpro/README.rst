====================
devkitpro containers
====================

Containers for building binaries with `devkitPro`_ toolchains, an open-source
development kit for game consoles that allows homebrew programmers to create
games and applications for their favorite systems.

----

Use the following commands to pull the images of these containers:

.. code-block:: bash

    podman pull docker.io/tprrt/debian-devkitpro-arm
    podman pull docker.io/tprrt/debian-devkitpro-arm64
    podman pull docker.io/tprrt/debian-devkitpro-ppc

Otherwise, it is possible to build images, with the commands below:

.. code-block:: bash

    podman build -t tprrt/debian-devkitpro-arm:latest --target debian-devkitpro-arm -f ./Dockerfile .
    podman build -t tprrt/debian-devkitpro-arm64:latest --target debian-devkitpro-arm64 -f ./Dockerfile .
    podman build -t tprrt/debian-devkitpro-ppc:latest --target debian-devkitpro-ppc -f ./Dockerfile .


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
        tprrt/debian-devkitpro-[arm|arm64|ppc]


Stop the container:

.. code-block:: bash

    podman container stop -t=1 tprrt/debian-devkitpro-[arm|arm64|ppc]
    podman container rm tprrt/debian-devkitpro-[arm|arm64|ppc]
    xhost -"local:podman@


.. _devkitPro: https://devkitpro.org
