FROM parrotsec/core:rolling
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.8-2

# Install build dependencies
RUN apt-get update && apt-get -y full-upgrade && apt-get -y install git-buildpackage ubuntu-dev-tools devscripts debhelper dh-apparmor dh-autoreconf dh-buildinfo dh-cargo dh-consoledata dh-di dh-exec dh-golang dh-linktree dh-lisp dh-lua dh-make dh-make-golang dh-make-perl dh-metainit dh-perl6 dh-php dh-python dh-runit dh-strip-nondeterminism dh-sysuser dh-vim-addon dh-virtualenv kernel-wedge; rm -rf /var/lib/apt/lists/*

# Try to install debhelper systemd support if available
RUN apt-get update && apt-get -y install dh-systemd || true; rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash -c "$@"
CMD bash -c "$@"
