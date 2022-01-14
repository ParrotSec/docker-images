FROM docker.io/parrotsec/core:5.0
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 7.91-4.11

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y --no-install-recommends install parrot-menu;apt-get -y install nmap ncat ndiff dnsutils netcat telnet; rm -rf /var/lib/apt/lists/*

ENTRYPOINT nmap $@
