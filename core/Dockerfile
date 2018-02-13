FROM debian:9
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive

# Prepare environment
RUN apt-get update; apt-get -y dist-upgrade;
RUN apt-get -y install apt-transport-https gnupg apt-utils wget
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
# Migrate from Debian to Parrot
RUN echo > /etc/apt/sources.list;\
	echo "deb http://deb.parrotsec.org/parrot stable main contrib non-free" > /etc/apt/sources.list.d/parrot.list;\
	echo "#check /etc/apt/sources.list.d/parrot.list" > /etc/apt/sources.list;\
	wget -qO - https://archive.parrotsec.org/parrot/misc/parrotsec.gpg | apt-key add -;\
	apt-get update;\
	apt-get -y dist-upgrade;


# Install Parrot Core
RUN apt-get -y --no-install-recommends --no-install-suggests install parrot-core apt-parrot base-files;\
	apt-get -y autoremove;\
	apt-get clean;\
	apt-get autoclean

ENTRYPOINT bash $@
