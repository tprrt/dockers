.. image:: https://circleci.com/gh/tprrt/dockers.svg?style=svg&circle-token=8794b4eb585ada86a0521f8c215903faa223de40
    :alt: Circle badge
    :target: https://app.circleci.com/pipelines/github/tprrt/dockers

======================
Dockerfiles collection
======================

A collection of Dockerfiles can be used with `Podman`_:

- `alpine-cmake`_: An environment to compile C source with cmake and to debug it with gdb.
- `alpine-pxe`_: A `PXE`_/`TFTP`_ server to boot targets from the network.
- `debian-buildroot`_: An environment to build Linux systems with the `Buildroot`_ framework.
- `debian-cross`_: An cross-compile environment providing tools for armv7, aarch64 and riscv targets.
- `debian-oe`_: An environment to build Linux systems with the `OpenEmbedded`_ framework / `Yocto`_ project.

*Note*

- `Podman`_ is a daemonless container engine, developped by the `OCI`_ and safer than the `Docker`_ engine.
- The container `pixiecore`_ is a great alterative to the container `alpine-pxe`_.
- The `debian-oe`_ is an alternative to the official container `crops/yocto`_

.. _alpine-cmake: https://hub.docker.com/repository/docker/tprrt/alpine-cmake
.. _alpine-pxe: https://hub.docker.com/repository/docker/tprrt/alpine-pxe
.. _debian-buildroot: https://hub.docker.com/repository/docker/tprrt/debian-buildroot
.. _debian-cross: https://hub.docker.com/repository/docker/tprrt/debian-cross

.. _Buildroot: https://buildroot.org
.. _crops/yocto : https://hub.docker.com/r/crops/yocto
.. _Docker: https://www.docker.com
.. _OCI: https://opencontainers.org
.. _OpenEmbedded: https://openembedded.org
.. _pixiecore: https://hub.docker.com/r/pixiecore/pixiecore
.. _Podman: https://podman.io
.. _PXE: https://en.wikipedia.org/wiki/Preboot_Execution_Environment
.. _TFTP: https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol
.. _Yocto: https://yoctoproject.org
