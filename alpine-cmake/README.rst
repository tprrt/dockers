CMake builder container
-----------------------

A container to build quickly projects using cmake, gcc, clang and essential build tools for compiling C/C++.

::

    podman build -t tprrt/alpine-cmake:latest -f ./Dockerfile .

    # Launch the container
    cd <src>
    podman run --rm -i -t \
        --security-opt seccomp=unconfined --security-opt label=disable \
	--userns=keep-id \
	--mount type=bind,source=$(pwd),target=/src \
	--workdir /src \
	tprrt/alpine-cmake

    # Stop the container
    podman container stop -t=1 tprrt/alpine-cmake
    podman container rm tprrt/alpine-cmake
