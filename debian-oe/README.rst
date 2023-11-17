======================
OpenEmbedded container
======================

A container to build a complete Linux system with the following branches of the
`OpenEmbedded`_ framework used by the `Yocto Project`_:

- master
- Kirkstone (LTS)
- Honister
- Dunfell (LTS)

----

Use the following command to pull the image of this container:

.. code-block:: bash

    podman pull docker.io/tprrt/debian-oe


Otherwise, it is possible to build the image, with the command below:

.. code-block:: bash

    podman build -t tprrt/debian-oe:latest -f ./Dockerfile .


Run the container:

.. code-block:: bash

    xhost +"local:podman@"

    cd <src>
    podman run --rm -i -t \
        --security-opt seccomp=unconfined --security-opt label=disable \
        --cap-add=NET_ADMIN --cap-add=NET_RAW \
        --userns=keep-id \
        --device /dev/kvm \
        --device /dev/net/tun \
        --device /dev/vhost-net \
        --volume $(realpath $SSH_AUTH_SOCK):/ssh-agent --env SSH_AUTH_SOCK=/ssh-agent\
        --mount type=bind,source=$(pwd),target=/src \
        --workdir /src \
	-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
        tprrt/debian-oe


Stop the container:

.. code-block:: bash

    podman container stop -t=1 tprrt/debian-oe
    podman container rm tprrt/debian-oe
    xhost -"local:podman@


.. _OpenEmbedded: https://openembedded.org
.. _Yocto Project: https://yoctoproject.org
