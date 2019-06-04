FROM parrotsec/parrot-core:latest
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 5.0.24-4.6

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y --no-install-recommends install parrot-menu;apt-get -y install parrot-pico metasploit-framework postgresql; rm -rf /var/lib/apt/lists/*

ENTRYPOINT msfconsole-start $@
