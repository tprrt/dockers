.. image:: https://circleci.com/gh/tprrt/dockers.svg?style=svg
    :alt: Circle badge
    :target: https://app.circleci.com/pipelines/github/tprrt/dockers

.. image:: https://sonarcloud.io/api/project_badges/measure?project=tprrt_dockers&metric=alert_status
    :alt: Quality Gate Status
    :target: https://sonarcloud.io/dashboard?id=tprrt_dockers

======================
Dockerfiles collection
======================

A collection of Dockerfiles can be used with `Podman`_ and whose images are available on `DockerHub`_:

- `alpine-cmake`_: An environment to compile C source with cmake and to debug it with gdb.
- `alpine-pxe`_: A `PXE`_/`TFTP`_ server to boot targets from the network.
- `debian-buildroot`_: An environment to build Linux systems with the `Buildroot`_ framework.
- `debian-cross`_: An cross-compile environment providing tools for armv7, aarch64 and riscv targets.
- `debian-gh`_: An environment that provides the official `Github CLI`_.
- `debian-latex`_: An environment to prepare documents with the `LaTeX`_ software system.
- `debian-devkitpro-arm`_: An environment that provides `_devkitPro`_, an open source game consoles devkit.
- `debian-devkitpro-arm64`_: An environment that provides `_devkitPro`_, an open source game consoles devkit.
- `debian-devkitpro-ppc`_: An environment that provides `_devkitPro`_, an open source game consoles devkit.
- `debian-oe`_: An environment to build Linux systems with the `OpenEmbedded`_ framework / `Yocto`_ project.
- `fedora-dev`_: An environment providing tools to develop an application for `Fedora`_.
- `ubuntu-ngdevkit`_: An environment that provides `ngdevkit`_, an open source Neo-Geo devkit.

Use the following command to pull the image of one of these containers:

.. code-block:: bash

    podman pull docker.io/tprrt/<name>


*Note*

- `Podman`_ is a daemonless container engine, developped by the `OCI`_ and safer than the `Docker`_ engine.
- The container `pixiecore`_ is a great alterative to the container `alpine-pxe`_.
- The `debian-oe`_ is an alternative to the official container `crops/yocto`_.
- The `debian-devkitpro` are an alternative to the official containers `devkitpro/docker`_.

----

Use the following command to validate the `circleci`_ pipeline:

.. code-block:: bash

    podman run --rm --security-opt seccomp=unconfined --security-opt label=disable -v $(pwd):/data circleci/circleci-cli:alpine config validate /data/.circleci/config.yml --token $TOKEN


.. _alpine-cmake: https://hub.docker.com/repository/docker/tprrt/alpine-cmake
.. _alpine-pxe: https://hub.docker.com/repository/docker/tprrt/alpine-pxe
.. _debian-buildroot: https://hub.docker.com/repository/docker/tprrt/debian-buildroot
.. _debian-cross: https://hub.docker.com/repository/docker/tprrt/debian-cross
.. _debian-devkitpro-arm: https://hub.docker.com/repository/docker/tprrt/debian-devkitpro-arm
.. _debian-devkitpro-arm64: https://hub.docker.com/repository/docker/tprrt/debian-devkitpro-arm64
.. _debian-devkitpro-ppc: https://hub.docker.com/repository/docker/tprrt/debian-devkitpro-ppc
.. _debian-gh: https://hub.docker.com/repository/docker/tprrt/debian-gh
.. _debian-latex: https://hub.docker.com/repository/docker/tprrt/debian-latex
.. _debian-oe: https://hub.docker.com/repository/docker/tprrt/debian-oe
.. _fedora-dev: https://hub.docker.com/repository/docker/tprrt/fedora-dev
.. _ubuntu-ngdevkit: https://hub.docker.com/repository/docker/tprrt/ubuntu-ngdevkit

.. _Buildroot: https://buildroot.org
.. _circleci: https://circleci.com
.. _crops/yocto : https://hub.docker.com/r/crops/yocto
.. _devkitPro: https://devkitpro.org
.. _devkitpro/docker: https://github.com/devkitPro/docker
.. _Docker: https://www.docker.com
.. _DockerHub: https://hub.docker.com/u/tprrt
.. _Fedora: https://getfedora.org
.. _GitHub CLI: https://cli.github.com/
.. _LaTeX: https://www.latex-project.org
.. _OCI: https://opencontainers.org
.. _OpenEmbedded: https://openembedded.org
.. _ngdevkit: https://github.com/dciabrin/ngdevkit
.. _pixiecore: https://hub.docker.com/r/pixiecore/pixiecore
.. _Podman: https://podman.io
.. _PXE: https://en.wikipedia.org/wiki/Preboot_Execution_Environment
.. _TFTP: https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol
.. _Yocto: https://yoctoproject.org

Support
-------

If you find this project helpful, you can support its development:

.. image:: https://img.shields.io/badge/PayPal-Donate-blue.svg
    :alt: Donate via PayPal
    :target: https://paypal.me/tprrt

License
-------

This project is licensed under the GNU General Public License v3.0 or later - see the `LICENSE`_ file for details.

.. _LICENSE: LICENSE
