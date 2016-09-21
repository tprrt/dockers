FROM alpine:latest

ENV DIST wheezy
ENV MIRROR http://ftp.fr.debian.org
ENV ARCH amd64

RUN apk add --update dnsmasq wget iptables && rm -rf /var/cache/apk/*
RUN wget --no-check-certificate https://raw.github.com/jpetazzo/pipework/master/pipework
RUN chmod +x pipework
RUN mkdir /tftp

WORKDIR /tftp

RUN wget $MIRROR/debian/dists/$DIST/main/installer-$ARCH/current/images/netboot/debian-installer/$ARCH/pxelinux.0
RUN mkdir pxelinux.cfg

CMD \
    echo Setting up iptables... &&\
    iptables -t nat -A POSTROUTING -j MASQUERADE &&\
    echo Waiting for pipework to give us the eth1 interface... &&\
    /pipework --wait &&\
    myIP=$(ip addr show dev eth1 | awk -F '[ /]+' '/global/ {print $3}') &&\
    mySUBNET=$(echo $myIP | cut -d '.' -f 1,2,3) &&\
    printf "DEFAULT vmlinuz\nKERNEL vmlinuz\nAPPEND initrd=initrd.img ip=dhcp tapos_tftp=$myIP\n" > pxelinux.cfg/default &&\
    echo Starting DHCP+TFTP server...&&\
    dnsmasq --interface=eth1 \
    	    --dhcp-range=$mySUBNET.101,$mySUBNET.199,255.255.255.0,1h \
	    --dhcp-boot=pxelinux.0,pxeserver,$myIP \
	    --pxe-service=x86PC,"Install Linux",pxelinux \
	    --enable-tftp --tftp-root=/tftp/ --no-daemon
