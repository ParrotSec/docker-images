# parrot
Official Parrot Security image with basic security tools.

## Install/Update from docker cloud
```docker pull parrotsec/parrot```

## Install/Update from local Dockerfile
```git clone https://dev.parrotsec.org/parrot/docker-images && cd docker-images```

```docker build -t parrot[:version] parrot```

## Start a new instance
changes are discarded on exit

public image from docker cloud
```docker run -ti --network host parrotsec/parrot```

local image from Dockerfile
```docker run -ti -network host parrot```





# parrot-core
Official Parrot Security Base system without tools.

## Install/Update from docker cloud
```docker pull parrotsec/parrot-core```

## Install/Update from local Dockerfile
```git clone https://dev.parrotsec.org/parrot/docker-images && cd docker-images```

```docker build -t parrot-core[:version] parrot-core```

## Start a new instance
changes are discarded on exit

public image from docker cloud
```docker run -ti --network host parrotsec/parrot-core```

local image from Dockerfile
```docker run -ti -network host parrot-core```



# metasploit
Parrot Security Metasploit bundle

## Install/Update from docker cloud
```docker pull parrotsec/metasploit```

## Install/Update from local Dockerfile
```git clone https://dev.parrotsec.org/parrot/docker-images && cd docker-images```

```docker build -t metasploit[:version] metasploit```

## Start a new instance
changes are discarded on exit

public image from docker cloud
```docker run -ti --network host parrotsec/metasploit```

local image from Dockerfile
```docker run -ti -network host metasploit```
