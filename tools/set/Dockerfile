FROM parrotsec/tools-metasploit:latest
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 8.0.3-4.11

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y --no-install-recommends install parrot-menu;apt-get -y install set; rm -rf /var/lib/apt/lists/*

ENTRYPOINT setoolkit $@
