FROM debian:jessie

RUN echo "deb http://ftp.de.debian.org/debian jessie main"

RUN apt-get update && apt-get install -y tftpd-hpa isc-dhcp-server pxe syslinux wget ethtool

# DHCP
# dhcp config file: /etc/dhcp/dhcpd.conf

# TFTP
# tftp config file: /etc/default/tftpd-hpa

RUN mkdir /var/lib/tftpboot/
RUN chmod 777 /var/lib/tftpboot

# PXE boot files
RUN cp /usr/lib/syslinux/memdisk /var/lib/tftpboot/
RUN cp /usr/lib/syslinux/modules/bios/ldlinux.c32 /var/lib/tftpboot/
RUN cp /usr/lib/syslinux/modules/bios/chain.c32 /var/lib/tftpboot/
RUN cp /usr/lib/syslinux/modules/bios/mboot.c32 /var/lib/tftpboot/
RUN cp /usr/lib/syslinux/modules/bios/menu.c32 /var/lib/tftpboot/
RUN cp /usr/lib/syslinux/modules/bios/reboot.c32 /var/lib/tftpboot/
RUN cp /usr/lib/syslinux/modules/bios/reboot.c32 /var/lib/tftpboot/

RUN wget -O /var/lib/tftpboot/pxelinux.0 http://ftp.nl.debian.org/debian/dists/jessie/main/installer-amd64/current/images/netboot/debian-installer/amd64/pxelinux.0

RUN mkdir /var/lib/tftpboot/pxelinux.cfg
ADD default /var/lib/tftpboot/pxelinux.cfg/default
ADD boot.txt /var/lib/tftpboot/boot.txt
ADD dhcp.conf.template /etc/dhcp/dhcpd.conf

RUN mkdir -p /var/lib/tftpboot/debian/jessie/amd64
RUN wget -O /var/lib/tftpboot/debian/jessie/amd64/initrd.gz http://ftp.nl.debian.org/debian/dists/jessie/main/installer-amd64/current/images/netboot/debian-installer/amd64/initrd.gz
RUN wget -O /var/lib/tftpboot/debian/jessie/amd64/linux http://ftp.nl.debian.org/debian/dists/jessie/main/installer-amd64/current/images/netboot/debian-installer/amd64/linux

ADD init.sh /root/init.sh 
RUN echo "sh /root/init.sh\n">> /etc/.bashrc

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

#CMD \
#    ethtool --offload  eth0  rx off  tx off \
#    service isc-dhcp-server restart \
#    /etc/init.d/tftpd-hpa restart

CMD \
    #service isc-dhcp-server restart &&
    /etc/init.d/tftpd-hpa restart



