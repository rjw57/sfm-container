FROM ubuntu:14.04
MAINTAINER Rich Wareham <rjw57@cam.ac.uk>

# Make sure apt & dpkg don't moan about TERM not being set
RUN echo 'debconf debconf/frontend select Noninteractive' | \
	debconf-set-selections

RUN apt-get -y update && apt-get -y install \
	git build-essential cmake libpng-dev libjpeg8-dev libtiff-dev \
	libxxf86vm1 libxxf86vm1 libxxf86vm-dev x11proto-xf86vidmode-dev \
	libxrandr-dev libatlas-base-dev libgoogle-glog-dev libeigen3-dev \
	libgflags-dev libsuitesparse-dev libcgal-dev subversion \
	libboost-iostreams-dev libopencv-dev libglu-dev

ADD install_ceres.sh .
RUN ./install_ceres.sh

ADD install_openmvg.sh .
RUN ./install_openmvg.sh

ADD install_openmvs.sh openmvs-hacks.patch /
RUN ./install_openmvs.sh
