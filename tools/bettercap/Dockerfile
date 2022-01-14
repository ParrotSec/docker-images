FROM docker.io/parrotsec/core:5.0
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 2.29-4.11

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y --no-install-recommends install parrot-menu;apt-get -y install bettercap; rm -rf /var/lib/apt/lists/*

ENTRYPOINT bettercap $@
