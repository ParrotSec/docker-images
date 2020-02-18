FROM parrotsec/core:rolling
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 2.21-4.8

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y --no-install-recommends install parrot-menu;apt-get -y install bettercap; rm -rf /var/lib/apt/lists/*

ENTRYPOINT bettercap $@
