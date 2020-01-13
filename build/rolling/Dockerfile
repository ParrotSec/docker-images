FROM parrotsec/core:rolling
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.8

# Install components
RUN apt-get update; apt-get -y dist-upgrade; rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/share/man/man1/ \
&& apt-get install -y -q --allow-downgrades --no-install-recommends \
   build-essential curl devscripts equivs git-buildpackage git \
   lsb-release make autoconf automake libtool zsh \
   sbuild dh-autoreconf debhelper moreutils sudo
&& apt-get clean
&& ; rm -rf /var/lib/apt/lists/*

# Add builder user and perform hacks
RUN useradd -ms /bin/bash builder;adduser builder sbuild;adduser root sbuild;mkdir -p /etc/sudoers.d;echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder-nopasswd;echo true > /sbin/modprobe;chmod +x /sbin/modprobe;sed -i 's/mount -t proc proc/mount -t --bind \/proc/' /usr/bin/sbuild-createchroot


# Copy scripts
COPY ../init.sh /init.sh
COPY ../entrypoint.sh /entrypoint.sh

# Setup environment
RUN chmod 775 /init.sh /entrypoint.sh; /init.sh

# Switch build user and prepare work dir
# USER builder
# WORKDIR /home/builder
# RUN bash /init.sh

WORKDIR /root
ENTRYPOINT ["/tini", "--"]

CMD /bin/bash

##
## WORK IN FUCKING PROGRESS
##


ENTRYPOINT bash $@
