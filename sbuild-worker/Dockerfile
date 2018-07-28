FROM parrotsec/parrot-core:latest
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.1

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y install sbuild devscripts debhelper ubuntu-dev-tools moreutils; rm -rf /var/lib/apt/lists/*

# Add user
RUN useradd -ms /bin/bash builder
RUN adduser builder sbuild
USER builder
WORKDIR /home/builder

COPY init.sh /init.sh
RUN /init.sh


##
## WORK IN FUCKING PROGRESS
##


ENTRYPOINT bash $@
