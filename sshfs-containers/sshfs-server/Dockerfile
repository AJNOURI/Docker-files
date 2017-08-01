# DockerVPC image
# AJ NOURI: ajn.bin@gmail.com
# cciethebeginning.wordpress.com
#
# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.9.16

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Tell debconf to run in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Enable SSH loging provided by Baseimage docker and regenerate keys
RUN rm -f /etc/service/sshd/down
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh


RUN echo 'root:gns3vpc' | chpasswd
RUN sed -i "s/#PermitRootLogin without-password/PermitRootLogin yes/" /etc/ssh/sshd_config
