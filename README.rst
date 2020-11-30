.. image:: https://circleci.com/gh/tprrt/dockers.svg?style=svg&circle-token=8794b4eb585ada86a0521f8c215903faa223de40
    :alt: Circle badge
    :target: https://app.circleci.com/pipelines/github/tprrt/dockers

======================
Dockerfiles collection
======================

A collection of Dockerfiles:

- `alpine-cmake`_: An environment to compile C source with cmake and to debug it with gdb.
- `alpine-pxe`_: A PXE/TFTP server to boot a target from the network.
- `debian-cross`_: An cross-compile environment providing tools for armv7, aarch64 and riscv targets.

*Note* The container `pixiecore`_ is a great alterative to `alpine-pxe`_.

.. _alpine-cmake: https://hub.docker.com/repository/docker/tprrt/alpine-cmake
.. _alpine-pxe: https://hub.docker.com/repository/docker/tprrt/alpine-pxe
.. _debian-cross: https://hub.docker.com/repository/docker/tprrt/debian-cross
