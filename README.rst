..
.. -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

Dockerfiles collection
----------------------

OE Build server container
=========================

How to build the container, from this folder:

::

   docker build -t yocto-builder ./ubuntu-build-env


How to run the built container, from this folder:

::

   BUILDERCID=$(docker run -it --privileged -e LOCAL_USER_ID=`id -u $USER` -e LOCAL_USER_NAME=$USER -e LOCAL_KVM_ID=`getent group kvm|cut -f3 -d":"` -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK -v /home/$USER:/home/$USER/ -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --cap-add NET_ADMIN --device /dev/kvm:/dev/kvm --device /dev/net/tun:/dev/net/tun --device /dev/vhost-net:/dev/vhost-net -d yocto-builder)
   docker exec -ti -u $USER $BUILDERCID /bin/bash


OE Toaster server container
============================

How to build the container, from this folder:

::

   docker build -t yocto-toaster ./ubuntu-toaster-env


How to run the built container, from this folder:

::

   TOASTERCID=$(docker run -it --privileged -e LOCAL_USER_ID=`id -u $USER` -e LOCAL_USER_NAME=$USER -e LOCAL_KVM_ID=`getent group kvm|cut -f3 -d":"` -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK -v /home/$USER:/home/$USER/ -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --cap-add NET_ADMIN --device /dev/kvm:/dev/kvm --device /dev/net/tun:/dev/net/tun --device /dev/vhost-net:/dev/vhost-net -d yocto-toaster)
   docker exec -ti -u $USER $TOASTERCID /bin/bash
   ./pipework br0 $TOASTERCID 192.168.242.1/24
   docker exec -ti $TOASTERCID /bin/bash


PXE server container
====================

How to build the container, from this folder:

::

   docker build -t pxe-server ./alpine-pxe


How to run the built container, from this folder:

::

   PXECID=$(docker run --cap-add NET_ADMIN  -v ~/tftp/:/tftp/ -d pxe-server)
   ./pipework br0 $PXECID 192.168.242.1/24
   docker exec -ti $PXECID /bin/sh


Upstreaming
-----------

You are encouraged to fork the mirror on [github](https://github.com/tprrt/dockers/)
to share your patches, this is preferred for patch sets consisting of more than 
one patch. Other services like gitorious, repo.or.cz or self hosted setups are 
of course accepted as well, 'git fetch <remote>' works the same on all of them.
We recommend github because it is free, easy to use, has been proven to be reliable 
and has a really good web GUI.

Layer Maintainer: `Thomas Perrot <thomas.perrot@tupi.fr>`_
