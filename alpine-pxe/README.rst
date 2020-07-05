PXE server container
--------------------

How to build the container, from this folder:

::

   docker build -t pxe-server ./alpine-pxe


How to run the built container, from this folder:

::

   PXECID=$(docker run --cap-add NET_ADMIN  -v ~/tftp/:/tftp/ -d pxe-server)
   ./pipework br0 $PXECID 192.168.242.1/24
   docker exec -ti $PXECID /bin/sh
