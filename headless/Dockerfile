FROM debian:8

RUN apt update && \ 
    apt install wget git apt-transport-https -y && \
    /bin/echo -e "deb http://mirrordirector.archive.parrotsec.org/parrot parrot main contrib non-free" > /etc/apt/sources.list.d/parrot.list && \
    /bin/echo -e "# This file is empty, feel free to add here your custom APT repositories\n\n# The standard Parrot repositories are NOT here. If you want to\n# edit them, take a look into\n#                      /etc/apt/sources.list.d/parrot.list\n#                      /etc/apt/sources.list.d/debian.list\n\n\n\n# If you want to change the default parrot repositories setting\n# another localized mirror, then use the command parrot-mirror-selector\n# and see its usage message to know what mirrors are available\n\n\n\n#uncomment the following line to enable the Parrot Testing Repository\n#deb http://us.repository.frozenbox.org/parrot testing main contrib nonfree" > /etc/apt/sources.list && \
    wget -qO - https://archive.parrotsec.org/parrot/misc/parrotsec.gpg | apt-key add - && \
    apt-get update  && \
    DEBIAN_FRONTEND='noninteractive' apt install apt-parrot parrot-archive-keyring --no-install-recommends  && \
    parrot-mirror-selector default stable  && \
    apt-get update && \
    echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections && \
    DEBIAN_FRONTEND='noninteractive' apt install -y parrot-core  && \
    DEBIAN_FRONTEND='noninteractive' apt dist-upgrade -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" -y --no-install-recommends && \
    DEBIAN_FRONTEND='noninteractive' apt autoremove --force-yes -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN apt update && \
    DEBIAN_FRONTEND='noninteractive' apt install -y parrot-pico && \
    rm -rf /var/lib/apt/lists/*

CMD "/bin/bash"

