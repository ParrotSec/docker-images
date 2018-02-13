FROM parrot-core:latest
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive

# Install components
RUN apt-get update; apt-get -y dist-upgrade;
RUN apt-get -y --no-install-recommends install parrot-menu
RUN apt-get -y install parrot-pico metasploit-framework postgresql

ENTRYPOINT msfconsole-start $@
