# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.


# Run Ostinato in a container:
# xhost local:root
# docker run -v /tmp/.X11-unix:/tmp/.X11-unix \
#     -e DISPLAY=unix$DISPLAY \
#     ostinatoimg
#
# ostinatoimg : is the tag of the built image

FROM phusion/baseimage:0.9.16

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

WORKDIR /tmp

# Update the source list for appropriate repository, trusty 14.04 LTS, in this case.
# Generated from:
# https://wiki.ubuntu.com/DevelopmentCodeNames
# http://repogen.simplylinux.ch/

RUN echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty main" >> /etc/apt/sources.list
RUN echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty main universe" >> /etc/apt/sources.list
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty-security main" >> /etc/apt/sources.list
RUN echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty-updates main" >> /etc/apt/sources.list
RUN echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty-security main universe" >> /etc/apt/sources.list
RUN echo "deb-src http://fr.archive.ubuntu.com/ubuntu/ trusty-updates main universe" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y ostinato
EXPOSE 7878
# Start linphone
ENTRYPOINT ["drone"]
