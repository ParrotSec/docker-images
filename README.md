# Parrot Security rolling
Official Parrot Security image with basic security tools.

## Install/Update from docker cloud
```docker pull parrotsec/security```

## Install/Update from local Dockerfile
```git clone https://nest.parrotsec.org/parrot/docker-images && cd docker-images```

```docker build -t parrot-security[:version] security/rolling```

## Start a new instance
changes are discarded on exit

public image from docker cloud
```docker run -ti --network host parrotsec/security```

local image from Dockerfile
```docker run -ti -network host security/rolling```





# Parrot Core rolling
Official Parrot Core image.

## Install/Update from docker cloud
```docker pull parrotsec/core```

## Install/Update from local Dockerfile
```git clone https://nest.parrotsec.org/parrot/docker-images && cd docker-images```

```docker build -t parrot-core[:version] core/rolling```

## Start a new instance
changes are discarded on exit

public image from docker cloud
```docker run -ti --network host parrotsec/core```

local image from Dockerfile
```docker run -ti -network host core/rolling```



# Parrot Core LTS
Official Parrot Core image.

## Install/Update from docker cloud
```docker pull parrotsec/core```

## Install/Update from local Dockerfile
```git clone https://nest.parrotsec.org/parrot/docker-images && cd docker-images```

```docker build -t parrot-core[:version] core/lts```

## Start a new instance
changes are discarded on exit

public image from docker cloud
```docker run -ti --network host parrotsec/core```

local image from Dockerfile
```docker run -ti -network host core/lts```
