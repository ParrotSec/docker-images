FROM parrotsec/core:base-lts-i386
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.8-1

# Update base image
RUN	apt-get update;\
	apt-get -y dist-upgrade;\
	apt-get -y autoremove;\
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash $@
