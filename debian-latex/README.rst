LaTeX container
---------------

A container to prepare document with the`LaTeX`_ software system.

::

    podman build -t tprrt/debian-latex:latest -f ./Dockerfile .

    # Launch the container
    cd <src>
    podman run --rm -i -t \
        --security-opt seccomp=unconfined --security-opt label=disable \
        --userns=keep-id \
        --mount type=bind,source=$(pwd),target=/src \
        --workdir /src \
        tprrt/debian-latex \
        pdflatex <file>.tex

    # Stop the container
    podman container stop -t=1 tprrt/debian-latex
    podman container rm tprrt/debian-latex

.. _LaTeX: https://www.latex-project.org/
