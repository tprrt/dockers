CMake builder container
-----------------------

A container to build quickly projects using cmake, gcc, clang and essential build tools for compiling C/C++.

::

    podman build -t alpine-cmake:latest -f ./Dockerfile .
 
    # Launch the container
    cd <src>
    podman run --rm -i -t --security-opt seccomp=unconfined --security-opt label=disable --userns=keep-id --mount type=bind,source=$(pwd),target=/src --workdir /src alpine-cmake

    # Stop the container
    podman container stop -t=1 alpine-cmake
    podman container rm alpine-cmake
