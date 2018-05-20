FROM parrotsec/parrot-core:latest
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.0.1

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y install parrot-pico;apt-get -y install parrot-mini parrot-tools-cloud

ENTRYPOINT bash $@
