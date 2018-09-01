#!/bin/bash

set -e

echo "configuring sbuildrc"
echo "writing /home/builder/.sbuildrc"
echo -e "\
\$mailto = 'builder@parrotsec.org';\n\
\$distribution = 'parrot';\n\
\$build_arch_all = 1;\n\
\n\
1;" > $HOME/.sbuildrc
cat $HOME/.sbuildrc

echo "writing /home/builder/.mk-sbuild.rc"
echo -e "\
SCHROOT_CONF_SUFFIX=\"source-root-users=root,sbuild,admin,builder\n\
source-root-groups=root,sbuild,admin,builder\n\
preserve-environment=true\"\n\
SKIP_UPDATES='1'\n\
SKIP_PROPOSED='1'\n\
DEBOOTSTRAP_INCLUDE='devscripts ubuntu-dev-tools ca-certificates parrot-archive-keyring gnupg'\n\
" > $HOME/.mk-sbuild.rc
cat $HOME/.mk-sbuild.rc

#echo "running sbuild-update --keygen"
#sbuild-update --keygen
