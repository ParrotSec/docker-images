#!/bin/bash

set -e

DEBUILD_DEPENDENCIES="parrot-archive-keyring,ca-certificates,eatmydata,ccache,gnupg,dirmngr,devscripts,dh-autoreconf,dh-systemd,ubuntu-dev-tools,debhelper,moreutils,dh-apparmor,dh-di,dh-exec,dh-make,dh-python"
CHROOT_AMD64="/var/lib/schroot/chroots/parrot-amd64"
CHROOT_I386="/var/lib/schroot/chroots/parrot-i386"
CHROOT_ARM64="/var/lib/schroot/chroots/parrot-arm64"
CHROOT_ARMHF="/var/lib/schroot/chroots/parrot-armhf"
PACKAGE=$2


echo "Parrot Build Worker 0.1"

function amd64_build {
	if [ ! -d $CHROOT_AMD64 ];then
		sudo sbuild-createchroot --arch=amd64 --include=$DEBUILD_DEPENDENCIES stable $CHROOT_AMD64 http://deb.parrotsec.org/parrot
	fi
	
	if [ -d $CHROOT_AMD64 ];then
		echo -e "deb http://archive.parrotsec.org/parrot stable main contrib non-free\ndeb-src http://archive.parrotsec.org/parrot testing main contrib non-free"\
		 > $CHROOT_AMD64/etc/apt/sources.list
		schroot -u root -d / -c source:parrot-amd64 -- apt update
		schroot -u root -d / -c source:parrot-amd64 -- apt -y full-upgrade
		sbuild --arch=amd64 --dist=parrot --no-run-lintian --arch-all --arch-any $PACKAGE
	fi	
}

function i386_build {
	if [ ! -d $CHROOT_I386 ];then
		sudo sbuild-createchroot --arch=i386 --include=$DEBUILD_DEPENDENCIES stable $CHROOT_I386 http://deb.parrotsec.org/parrot
	fi
	
	if [ -d $CHROOT_I386 ];then
		echo -e "deb http://archive.parrotsec.org/parrot stable main contrib non-free\ndeb-src http://archive.parrotsec.org/parrot testing main contrib non-free"\
		 > $CHROOT_I386/etc/apt/sources.list
		schroot -u root -d / -c source:parrot-i386 -- apt update
		schroot -u root -d / -c source:parrot-i386 -- apt -y full-upgrade
		sbuild --arch=i386 --dist=testing --no-arch-all --arch-any --no-run-lintian $PACKAGE
	fi	
}

function arm64_build {
	if [ ! -d $CHROOT_ARM64 ];then
		sudo sbuild-createchroot --arch=arm64 --include=$DEBUILD_DEPENDENCIES stable $CHROOT_ARM64 http://deb.parrotsec.org/parrot
	fi
	
	if [ -d $CHROOT_ARM64 ];then
		echo -e "deb http://archive.parrotsec.org/parrot stable main contrib non-free\ndeb-src http://archive.parrotsec.org/parrot testing main contrib non-free"\
		 > $CHROOT_ARM64/etc/apt/sources.list
		schroot -u root -d / -c source:parrot-arm64 -- apt update
		schroot -u root -d / -c source:parrot-arm64 -- apt -y full-upgrade
		sbuild --arch=arm64 --dist=testing --no-arch-all --arch-any --no-run-lintian $PACKAGE
	fi	
}

function armhf_build {
	if [ ! -d $CHROOT_ARMHF ];then
		sudo sbuild-createchroot --arch=armhf --include=$DEBUILD_DEPENDENCIES stable $CHROOT_ARMHF http://deb.parrotsec.org/parrot
	fi
	
	if [ -d $CHROOT_ARMHF ];then
		echo -e "deb http://archive.parrotsec.org/parrot stable main contrib non-free\ndeb-src http://archive.parrotsec.org/parrot testing main contrib non-free"\
		 > $CHROOT_ARMHF/etc/apt/sources.list
		schroot -u root -d / -c source:parrot-armhf -- apt update
		schroot -u root -d / -c source:parrot-armhf -- apt -y full-upgrade
		sbuild --arch=armhf --dist=testing --no-arch-all --arch-any --no-run-lintian $PACKAGE
	fi	
}



case "$1" in
	amd64)
		amd64_build
	;;
	i386)
		i386_build
	;;
	arm64)
		arm64_build
	;;
	armhf)
	    armhf_build
	;;
	all)
		amd64_build
		i386_build
		arm64_build
		armhf_build
	;;
	*)
		echo -e "invalid parameters"
		exit 1
	;;
esac
