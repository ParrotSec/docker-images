core-rolling-amd64:
	docker build -t parrotsec/core:rolling-amd64 core/rolling-amd64/

core-rolling-i386:
	docker build -t parrotsec/core:rolling-i386 core/rolling-i386/

core-lts-amd64:
	docker build -t parrotsec/core:lts-amd64 core/lts-amd64/

core-lts-i386:
	docker build -t parrotsec/core:lts-i386 core/lts-i386/

core-lts-arm64:
	docker build -t parrotsec/core:lts-arm64 core/lts-arm64/

core-lts-armhf:
	docker build -t parrotsec/core:lts-armhf core/lts-armhf/

core-rolling:
	docker build -t parrotsec/core:rolling core/rolling-amd64/

core-lts:
	docker build -t parrotsec/core:lts core/lts-amd64/

core-latest:
	docker build -t parrotsec/core:latest core/rolling-amd64/

core: core-rolling core-lts core-latest core-rolling-amd64 core-rolling-i386 core-lts-amd64 core-lts-i386 core-lts-arm64 core-lts-armhf

builder-rolling-amd64: core-rolling-amd64
	docker build -t parrotsec/build:rolling-amd64 build/rolling-amd64/

builder-rolling-i386: core-rolling-i386
	docker build -t parrotsec/build:rolling-i386 build/rolling-i386/

builder-lts-amd64: core-lts-amd64
	docker build -t parrotsec/build:lts-amd64 build/lts-amd64/

builder-lts-i386: core-lts-i386
	docker build -t parrotsec/build:lts-i386 build/lts-i386/

builder-lts-arm64: core-lts-arm64
	docker build -t parrotsec/build:lts-arm64 build/lts-arm64/

builder-lts-armhf: core-lts-armhf
	docker build -t parrotsec/build:lts-armhf build/lts-armhf/

builder-rolling: core-rolling
	docker build -t parrotsec/build:rolling build/rolling-amd64/

builder-lts: core-lts
	docker build -t parrotsec/build:lts build/lts-amd64/

builder-latest: core-latest
	docker build -t parrotsec/build:latest build/rolling-amd64/

builder: builder-rolling builder-lts builder-latest builder-rolling-amd64 builder-rolling-i386 builder-lts-amd64 builder-lts-i386 builder-lts-arm64 builder-lts-armhf


security-rolling: core-rolling
	docker build -t parrotsec/security:rolling security/rolling/
	docker build -t parrotsec/security:latest security/rolling/

security-lts: core-lts
	docker build -t parrotsec/security:lts security/lts/

security: security-rolling security-lts

tools-nmap: core-rolling
	docker build -t parrotsec/tools-nmap tools/nmap

tools-metasploit: tools-nmap
	docker build -t parrotsec/tools-metasploit tools/metasploit

tools-set: tools-metasploit
	docker build -t parrotsec/tools-set tools/set

tools: tools-nmap tools-metasploit tools-set
	docker build -t parrotsec/tools-bettercap tools/bettercap
	docker build -t parrotsec/tools-beef tools/beef
	docker build -t parrotsec/tools-sqlmap tools/sqlmap

build: core builder security tools

upload: build
	docker push parrotsec/core
	docker push parrotsec/build
	docker push parrotsec/security
	docker push parrotsec/tools-nmap
	docker push parrotsec/tools-metasploit
	docker push parrotsec/tools-set
	docker push parrotsec/tools-bettercap
	docker push parrotsec/tools-beef
	docker push parrotsec/tools-sqlmap
