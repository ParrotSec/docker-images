FROM parrotsec/core:rolling
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.8-1

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y install git-buildpackage ubuntu-dev-tools devscripts debhelper dh-acc dh-ada-library dh-apparmor dh-autoreconf dh-buildinfo dh-cargo dh-consoledata dh-di dh-dist-zilla dh-dlang dh-elpa dh-elpa-helper dh-exec dh-fortran-mod dh-golang dh-linktree dh-lisp dh-lua dh-make dh-make-elpa dh-make-golang dh-make-perl dh-metainit dh-perl6 dh-php dh-python dh-r dh-rebar dh-runit dh-strip-nondeterminism dh-systemd dh-sysuser dh-vim-addon dh-virtualenv kernel-wedge xbuilder; rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash -c "$@"
CMD bash -c "$@"
