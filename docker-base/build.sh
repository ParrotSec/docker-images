#!/bin/bash

function lts_amd64 {
	ARCH=amd64
	EDITION=lts
	echo "Building $EDITION-$ARCH"
	sudo debootstrap --arch=$ARCH --components=main,contrib,non-free --include=gnupg2,nano --exclude=parrot-core $EDITION $EDITION-$ARCH https://deb.parrot.sh/mirrors/parrot/ > $EDITION-$ARCH.log
	echo "Customizing $EDITION-$ARCH"
	sudo rm -rf $EDITION-$ARCH/var/cache/apt/*
	echo "Importing $EDITION-$ARCH in docker"
	sudo tar -C $EDITION-$ARCH -c . | docker import - parrotsec/core:base-$EDITION-$ARCH
	echo "Pushing $EDITION-$ARCH in docker hub"
	docker push parrotsec/core:base-$EDITION-$ARCH
	echo "Done $EDITION-$ARCH"
}

function lts_i386 {
	ARCH=i386
	EDITION=lts
	echo "Building $EDITION-$ARCH"
	sudo debootstrap --arch=$ARCH --components=main,contrib,non-free --include=gnupg2,nano --exclude=parrot-core $EDITION $EDITION-$ARCH https://deb.parrot.sh/mirrors/parrot/ > $EDITION-$ARCH.log
	echo "Customizing $EDITION-$ARCH"
	sudo rm -rf $EDITION-$ARCH/var/cache/apt/*
	echo "Importing $EDITION-$ARCH in docker"
	sudo tar -C $EDITION-$ARCH -c . | docker import - parrotsec/core:base-$EDITION-$ARCH
	echo "Pushing $EDITION-$ARCH in docker hub"
	docker push parrotsec/core:base-$EDITION-$ARCH
	echo "Done $EDITION-$ARCH"
}

function lts_arm64 {
	ARCH=arm64
	EDITION=lts
	echo "Building $EDITION-$ARCH"
	sudo debootstrap --arch=$ARCH --components=main,contrib,non-free --include=gnupg2,nano --exclude=parrot-core $EDITION $EDITION-$ARCH https://deb.parrot.sh/mirrors/parrot/ > $EDITION-$ARCH.log
	echo "Customizing $EDITION-$ARCH"
	sudo rm -rf $EDITION-$ARCH/var/cache/apt/*
	echo "Importing $EDITION-$ARCH in docker"
	sudo tar -C $EDITION-$ARCH -c . | docker import - parrotsec/core:base-$EDITION-$ARCH
	echo "Pushing $EDITION-$ARCH in docker hub"
	docker push parrotsec/core:base-$EDITION-$ARCH
	echo "Done $EDITION-$ARCH"
}


function lts_armhf {
	ARCH=armhf
	EDITION=lts
	echo "Building $EDITION-$ARCH"
	sudo debootstrap --arch=$ARCH --components=main,contrib,non-free --include=gnupg2,nano --exclude=parrot-core $EDITION $EDITION-$ARCH https://deb.parrot.sh/mirrors/parrot/ > $EDITION-$ARCH.log
	echo "Customizing $EDITION-$ARCH"
	sudo rm -rf $EDITION-$ARCH/var/cache/apt/*
	echo "Importing $EDITION-$ARCH in docker"
	sudo tar -C $EDITION-$ARCH -c . | docker import - parrotsec/core:base-$EDITION-$ARCH
	echo "Pushing $EDITION-$ARCH in docker hub"
	docker push parrotsec/core:base-$EDITION-$ARCH
	echo "Done $EDITION-$ARCH"
}

#rolling_amd64 &
#rolling_i386
lts_amd64 &
lts_i386
lts_arm64 &
lts_armhf
#tail -f done.log
