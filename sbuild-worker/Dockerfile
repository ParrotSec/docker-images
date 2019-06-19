FROM parrotsec/parrot-core:latest
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.7

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y install sbuild dh-autoreconf debhelper devscripts moreutils sudo gnupg2 dirmngr; rm -rf /var/lib/apt/lists/*

# Add builder user and perform hacks
RUN useradd -ms /bin/bash builder;adduser builder sbuild;adduser root sbuild;mkdir -p /etc/sudoers.d;echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder-nopasswd;echo true > /sbin/modprobe;chmod +x /sbin/modprobe;sed -i 's/mount -t proc proc/mount -t --bind \/proc/' /usr/bin/sbuild-createchroot


# Copy scripts
COPY init.sh /init.sh
COPY entrypoint.sh /entrypoint.sh

# Setup environment
RUN chmod 775 /init.sh /entrypoint.sh; /init.sh

# Switch build user and prepare work dir
USER builder
WORKDIR /home/builder
RUN bash /init.sh

##
## WORK IN FUCKING PROGRESS
##


ENTRYPOINT bash $@
