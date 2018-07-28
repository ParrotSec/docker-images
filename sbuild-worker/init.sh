#!/bin/bash

set -e

echo "configuring sbuildrc"
echo -e "
# Mail address where logs are sent to (mandatory, no default!)
$mailto = 'builder@parrotsec.org';
$distribution = 'parrot';
$build_arch_all = 1;

# don't remove this, Perl needs it:
1;" > /home/builder/.sbuildrc

echo -e "
SCHROOT_CONF_SUFFIX='source-root-users=root,sbuild,admin,builder
source-root-groups=root,sbuild,admin,builder
preserve-environment=true'
SKIP_UPDATES='1'
SKIP_PROPOSED='1'
DEBOOTSTRAP_INCLUDE='devscripts ubuntu-dev-tools ca-certificates parrot-archive-keyring gnupg'
" > /home/builder/.mk-sbuild.rc

sbuild-update --keygen

mk-sbuild parrot --arch=amd64 --skip-updates --debootstrap-mirror=http://archive.parrotsec.org/parrot --distro=debian
mk-sbuild parrot --arch=i386 --skip-updates --debootstrap-mirror=http://archive.parrotsec.org/parrot --distro=debian
mk-sbuild parrot --arch=arm64 --skip-updates --debootstrap-mirror=http://archive.parrotsec.org/parrot --distro=debian
mk-sbuild parrot --arch=armhf --skip-updates --debootstrap-mirror=http://archive.parrotsec.org/parrot --distro=debian
