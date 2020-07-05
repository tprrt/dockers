CMake builder container
-----------------------

A container to build quickly projects using cmake, gcc, clang and essential build tools for compiling C/C++.

::

    # Set required environment variables
    export LOCAL_USER_ID=$(id -u ${USER})
 
    # Build the docker image
    docker-compose build
 
    # Launch the container
    docker-compose up -d
 
    # Open the build environment
    docker-compose exec -u ${USER} alpine-cmake-builder /bin/bash
