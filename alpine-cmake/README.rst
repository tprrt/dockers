=======================
CMake builder container
=======================

A container to build quickly projects using cmake, gcc, clang and essential build tools for compiling C/C++.

----

Use the following command to pull the image of on of these container:

::

    podman pull docker.io/tprrt/alpine-cmake


Otherwise, it is possible to build the image, with the command below:

::

    podman build -t tprrt/alpine-cmake:latest -f ./Dockerfile .


Run the container:

::

    cd <src>
    podman run --rm -i -t \
        --security-opt seccomp=unconfined --security-opt label=disable \
	--userns=keep-id \
	--mount type=bind,source=$(pwd),target=/src \
	--workdir /src \
	tprrt/alpine-cmake


Stop the container:

::

    podman container stop -t=1 tprrt/alpine-cmake
    podman container rm tprrt/alpine-cmake
