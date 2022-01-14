FROM docker.io/parrotsec/core:base-lts-amd64
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 5.0-3

# Add LTS Repos

RUN echo "Package: *" > /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin: release n=lts" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin: release n=lts-backports" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin-Priority: 501" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin: release n=lts-updates" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin: release n=lts-security" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin: release n=parrot" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin: release n=parrot-backports" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin-Priority: 599" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin: release n=parrot-updates" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin: release n=parrot-security" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/parrot-pinning; \
    echo "Acquire::Retries \"4\";" > /etc/apt/apt.conf.d/99retry-on-error; \
    echo "deb https://deb.parrot.sh/parrot parrot main contrib non-free" > /etc/apt/sources.list; \
    echo "deb https://mirror.parrot.sh/direct/parrot parrot-security main contrib non-free" >> /etc/apt/sources.list; \
    echo "#deb https://deb.parrot.sh/parrot parrot-updates main contrib non-free" >> /etc/apt/sources.list; \
    echo "deb https://deb.parrot.sh/parrot parrot-backports main contrib non-free" >> /etc/apt/sources.list

# Update system
RUN	apt update;\
	apt -y dist-upgrade;\
	apt -y autoremove;\
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash $@
