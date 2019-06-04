FROM debian:buster
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.6-4

# Prepare environment
RUN apt-get update;apt-get -y --no-install-recommends install apt-transport-https dirmngr gnupg apt-utils wget ca-certificates; rm -rf /var/lib/apt/lists/* #;echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

# Migrate from Debian to Parrot
RUN echo > /etc/apt/sources.list;\
	echo "deb http://deb.parrotsec.org/parrot stable main contrib non-free" > /etc/apt/sources.list.d/parrot.list;\
	wget -qO - https://deb.parrotsec.org/parrot/misc/parrotsec.gpg | apt-key add -;\
	apt-get update;\
	apt-get -y dist-upgrade;\
	rm -rf /var/lib/apt/lists/*


# Install Parrot Core
RUN apt-get update;\
	apt-get -y --no-install-recommends --no-install-suggests install parrot-core apt-parrot base-files;\
	apt-get -y autoremove;\
	apt-get clean;\
	apt-get autoclean;\
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash $@
