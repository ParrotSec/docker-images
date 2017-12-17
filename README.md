# dockerized-parrot
Dockerized version of Parrot GNU/Linux.

- It is tested with low configuration machines (even with 1GB ram with 1vCPU it runs well!).
- You can run it in seconds after pulling the image. You can remove it in seconds as well. No installation is required other than Docker.
- You can have Dockerized Parrot GNU/Linux command line in only one command.
- You can build your images based on these images with your preferred tools and versions.
- Multiple instances can be run in the same time with minimal resource usage.

## Usage
Basic usage of pre-builded 'headless' image (runs latest version):
```
docker run -it guray/dockerized-parrot
```

There are three versions, all available from Docker Hub or you can build your own:
- Core Only
- Headless
- Standard
Image size increases to downwards on the list.

Core only image is minimal, but does not include lots of useful packages. It is suitable for creating your own image with your favourite tools.
i
Headless image and standard image includes many tools. Headless has 'parrot-pico' package while standard image includes 'parrot-tools' package.


If you want to build from stratch and run:
```
cd standard
docker build -t guray/dockerized-parrot:0.1-standard .
docker run -it guray/dockerized-parrot:0.1-standard
```

If you want to use host system's network, just add `--network host` in command:
```
docker run -it --network host guray/dockerized-parrot
```

Also, you may want to remove container when it is exited:
```
docker run -it --rm guray/dockerized-parrot
```



