# SSHFS client image
# AJ NOURI: ajn.bin@gmail.com
# cciethebeginning.wordpress.com
#
FROM phusion/baseimage

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Tell debconf to run in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get install -y sshfs

RUN mkdir /mount /data
VOLUME /mount
RUN ls -s /mount /data
