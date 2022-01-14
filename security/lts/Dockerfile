FROM docker.io/parrotsec/core:lts
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 5.0-1

# Install components
RUN apt-get update;apt-get -y install parrot-mini parrot-tools-cloud zulucrypt- sirikali- apache2*- nginx*- at-spi*- dconf*- gsettings*- gtk*- hicolor*- mesa-*- pyqt5*- qt5-*- qtbase5*- samba-common- alsa*- xserver*- zaproxy- burpsuite- xdg*- intel-*- wine*- i965-va-driver-  parrot-drivers- nvidia-*- wireshark-qt- x11*-; rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash $@
