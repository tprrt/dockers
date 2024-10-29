===============
LaTeX container
===============

A container to prepare document with the`LaTeX`_ software system.

----

Use the following command to pull the image of this container:

.. code-block:: bash

    podman pull docker.io/tprrt/debian-latex


Otherwise, it is possible to build the image, with the command below:

.. code-block:: bash

    podman build -t tprrt/debian-latex:latest -f ./Dockerfile .


Run the container:

.. code-block:: bash

    cd <src>
    podman run --rm -i -t \
        --security-opt seccomp=unconfined --security-opt label=disable \
        --userns=keep-id:uid=1000,gid=1000 \
        --mount type=bind,source=$(pwd),target=/src \
        --workdir /src \
        --pids-limit=0 \
        tprrt/debian-latex \
        pdflatex <file>.tex


Stop the container:

.. code-block:: bash

    podman container stop -t=1 tprrt/debian-latex
    podman container rm tprrt/debian-latex


.. _LaTeX: https://www.latex-project.org/
