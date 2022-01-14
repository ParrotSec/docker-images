FROM docker.io/parrotsec/core:lts-amd64
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 5.0-2

# Don't configure resolvconf symlink
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

# Install build dependencies
RUN apt-get update && apt-get -y full-upgrade && apt-get -y --allow-downgrades install git-buildpackage ubuntu-dev-tools devscripts debhelper dh-apparmor dh-autoreconf dh-buildinfo dh-cargo dh-consoledata dh-di dh-exec dh-golang dh-make dh-php dh-python dh-strip-nondeterminism dh-sysuser dh-virtualenv kernel-wedge; rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash -c "$@"
CMD bash -c "$@"
