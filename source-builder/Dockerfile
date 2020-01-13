FROM parrotsec/core:rolling
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.8-1

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y install git-buildpackage ubuntu-dev-tools devscripts dh-* kernel-wedge xbuilder; rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash $@
