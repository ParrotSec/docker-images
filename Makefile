docker-base:
	cd docker-base && ./build.sh

core-rolling:
	podman build -t docker.io/parrotsec/core:rolling-amd64 core/rolling-amd64/

core: docker-base
	podman build -t docker.io/parrotsec/core:amd64 core/lts-amd64/
	podman build -t docker.io/parrotsec/core:i386 core/lts-i386/
	podman build -t docker.io/parrotsec/core:arm64 core/lts-arm64/
	podman build -t docker.io/parrotsec/core:armhf core/lts-armhf/

builder:
	podman build -t docker.io/parrotsec/build:amd64 build/lts-amd64/
	podman build -t docker.io/parrotsec/build:i386 build/lts-i386/
	podman build -t docker.io/parrotsec/build:arm64 build/lts-arm64/
	podman build -t docker.io/parrotsec/build:armhf build/lts-armhf/


security:
	podman build -t docker.io/parrotsec/tools-nmap:latest tools/nmap
	podman build -t docker.io/parrotsec/tools-metasploit:latest tools/metasploit
	podman build -t docker.io/parrotsec/tools-set:latest tools/set
	podman build -t docker.io/parrotsec/tools-bettercap:latest tools/bettercap
	podman build -t docker.io/parrotsec/tools-beef:latest tools/beef
	podman build -t docker.io/parrotsec/tools-sqlmap:latest tools/sqlmap
	podman build -t docker.io/parrotsec/security:latest security/lts/

build: core-rolling core builder security

push-docker: build
	podman push docker.io/parrotsec/core:amd64 docker.io/parrotsec/core:lts-amd64
	podman push docker.io/parrotsec/core:amd64 docker.io/parrotsec/core:lts
	podman push docker.io/parrotsec/core:amd64 docker.io/parrotsec/core:latest
	podman push docker.io/parrotsec/core:amd64 docker.io/parrotsec/core:5
	podman push docker.io/parrotsec/core:amd64 docker.io/parrotsec/core:5.0
	podman push docker.io/parrotsec/core:amd64 docker.io/parrotsec/core:5.0.0

	podman push docker.io/parrotsec/core:arm64 docker.io/parrotsec/core:lts-arm64
	podman push docker.io/parrotsec/core:arm64 docker.io/parrotsec/core:5-arm64
	podman push docker.io/parrotsec/core:arm64 docker.io/parrotsec/core:5.0-arm64
	podman push docker.io/parrotsec/core:arm64 docker.io/parrotsec/core:5.0.0-arm64

	podman push docker.io/parrotsec/core:armhf docker.io/parrotsec/core:lts-armhf
	podman push docker.io/parrotsec/core:i386 docker.io/parrotsec/core:lts-i386

	podman push docker.io/parrotsec/core:rolling-amd64 docker.io/parrotsec/core:rolling-amd64
	podman push docker.io/parrotsec/core:rolling-amd64 docker.io/parrotsec/core:rolling

	podman push docker.io/parrotsec/build:amd64 docker.io/parrotsec/build:latest
	podman push docker.io/parrotsec/build:amd64 docker.io/parrotsec/build:amd64
	podman push docker.io/parrotsec/build:arm64 docker.io/parrotsec/build:arm64
	podman push docker.io/parrotsec/build:i386 docker.io/parrotsec/build:i386

	podman push docker.io/parrotsec/tools-nmap:latest docker.io/parrotsec/tools-nmap:latest
	podman push docker.io/parrotsec/tools-metasploit:latest docker.io/parrotsec/tools-metasploit:latest
	podman push docker.io/parrotsec/tools-set:latest docker.io/parrotsec/tools-set:latest
	podman push docker.io/parrotsec/tools-bettercap:latest docker.io/parrotsec/tools-bettercap:latest
	podman push docker.io/parrotsec/tools-beef:latest docker.io/parrotsec/tools-beef:latest
	podman push docker.io/parrotsec/tools-sqlmap:latest docker.io/parrotsec/tools-sqlmap:latest
	podman push docker.io/parrotsec/security:latest docker.io/parrotsec/security:latest
	podman push docker.io/parrotsec/security:latest docker.io/parrotsec/security:5
	podman push docker.io/parrotsec/security:latest docker.io/parrotsec/security:5.0
	podman push docker.io/parrotsec/security:latest docker.io/parrotsec/security:5.0.0

push-parrot: build
	podman push docker.io/parrotsec/core:amd64 registry.parrot.run/core:lts-amd64
	podman push docker.io/parrotsec/core:amd64 registry.parrot.run/core:lts
	podman push docker.io/parrotsec/core:amd64 registry.parrot.run/core:latest
	podman push docker.io/parrotsec/core:amd64 registry.parrot.run/core:5
	podman push docker.io/parrotsec/core:amd64 registry.parrot.run/core:5.0
	podman push docker.io/parrotsec/core:amd64 registry.parrot.run/core:5.0.0

	podman push docker.io/parrotsec/core:arm64 registry.parrot.run/core:lts-arm64
	podman push docker.io/parrotsec/core:arm64 registry.parrot.run/core:5-arm64
	podman push docker.io/parrotsec/core:arm64 registry.parrot.run/core:5.0-arm64
	podman push docker.io/parrotsec/core:arm64 registry.parrot.run/core:5.0.0-arm64

	podman push docker.io/parrotsec/core:armhf registry.parrot.run/core:lts-armhf
	podman push docker.io/parrotsec/core:i386 registry.parrot.run/core:lts-i386

	podman push docker.io/parrotsec/core:rolling-amd64 registry.parrot.run/core:rolling-amd64
	podman push docker.io/parrotsec/core:rolling-amd64 registry.parrot.run/core:rolling

	podman push docker.io/parrotsec/build:amd64 registry.parrot.run/build:latest
	podman push docker.io/parrotsec/build:amd64 registry.parrot.run/build:amd64
	podman push docker.io/parrotsec/build:arm64 registry.parrot.run/build:arm64
	podman push docker.io/parrotsec/build:i386 registry.parrot.run/build:i386

	podman push docker.io/parrotsec/tools-nmap:latest registry.parrot.run/tools-nmap:latest
	podman push docker.io/parrotsec/tools-metasploit:latest registry.parrot.run/tools-metasploit:latest
	podman push docker.io/parrotsec/tools-set:latest registry.parrot.run/tools-set:latest
	podman push docker.io/parrotsec/tools-bettercap:latest registry.parrot.run/tools-bettercap:latest
	podman push docker.io/parrotsec/tools-beef:latest registry.parrot.run/tools-beef:latest
	podman push docker.io/parrotsec/tools-sqlmap:latest registry.parrot.run/tools-sqlmap:latest
	podman push docker.io/parrotsec/security:latest registry.parrot.run/security:latest
	podman push docker.io/parrotsec/security:latest registry.parrot.run/security:5
	podman push docker.io/parrotsec/security:latest registry.parrot.run/security:5.0
	podman push docker.io/parrotsec/security:latest registry.parrot.run/security:5.0.0
