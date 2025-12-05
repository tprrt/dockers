====================
Github CLI container
====================

A container that provides the official `Github CLI`_.

----

Use the following command to pull the image of this container:

.. code-block:: bash

    podman pull docker.io/tprrt/debian-gh


Otherwise, it is possible to build the image, with the command below:

.. code-block:: bash

    podman build -t tprrt/debian-gh:latest -f ./Dockerfile .


Run the container:

.. code-block:: bash

    cd <src>
    podman run --rm -i -t \
        --security-opt seccomp=unconfined --security-opt label=disable \
        --cap-add=NET_ADMIN --cap-add=NET_RAW \
        --userns=keep-id:uid=$(id -u),gid=$(id -g) \
        --device /dev/net/tun \
        --device /dev/vhost-net \
        --volume $(realpath $SSH_AUTH_SOCK):/ssh-agent --env SSH_AUTH_SOCK=/ssh-agent \
        --mount type=bind,source=$(pwd),target=/src \
        --workdir /src \
        --pids-limit=0 \
        tprrt/debian-gh

    echo "<your_token>" > /tmp/token
    gh auth login --git-protocol=ssh --with-token < /tmp/token


Stop the container:

.. code-block:: bash

    podman container stop -t=1 tprrt/debian-gh
    podman container rm tprrt/debian-gh


.. _GitHub CLI: https://cli.github.com/
