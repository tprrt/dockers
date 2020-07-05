OE Build server container
-------------------------

How to build the container, from this folder:

::

   docker build -t yocto-builder ./ubuntu-build-env


How to run the built container, from this folder:

::

   BUILDERCID=$(docker run -it --privileged -e LOCAL_USER_ID=`id -u $USER` -e LOCAL_USER_NAME=$USER -e LOCAL_KVM_ID=`getent group kvm|cut -f3 -d":"` -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK -v /home/$USER:/home/$USER/ -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --cap-add NET_ADMIN --device /dev/kvm:/dev/kvm --device /dev/net/tun:/dev/net/tun --device /dev/vhost-net:/dev/vhost-net -d yocto-builder)
   docker exec -ti -u $USER $BUILDERCID /bin/bash
