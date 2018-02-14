# parrot
Official Parrot Security image with basic tools.

## Install/Update from docker cloud
```docker pull parrotsec/parrot```

## Install/Update from local Dockerfile
```docker build -t parrot[:version] parrot```

## Start with no persistence
changes are discarded on exit

public image from docker cloud
```docker run -ti --network host parrotsec/parrot```

local image from Dockerfile
```docker run -ti -network host parrot```

## Start with persistence
changes are preserved

public image from docker cloud
```docker run -ti -v parrot:/ --network host parrotsec/parrot```

local image from Dockerfile
```docker run -ti -v parrot:/ --network host parrot```





# parrot-core
Official Parrot Security Base system without tools.

## Install/Update from docker cloud
```docker pull parrotsec/parrot-core```

## Install/Update from local Dockerfile
```docker build -t parrot-core[:version] parrot-core```

## Start with no persistence
changes are discarded on exit

public image from docker cloud
```docker run -ti --network host parrotsec/parrot-core```

local image from Dockerfile
```docker run -ti -network host parrot-core```

## Start with persistence
changes are preserved

public image from docker cloud
```docker run -ti -v parrot-core:/ --network host parrotsec/parrot-core```

local image from Dockerfile
```docker run -ti -v parrot-core:/ --network host parrot-core```



# metasploit
Parrot Security Metasploit bundle

## Install/Update from docker cloud
```docker pull parrotsec/metasploit```

## Install/Update from local Dockerfile
```docker build -t metasploit[:version] metasploit```

## Start with no persistence
changes are discarded on exit

public image from docker cloud
```docker run -ti --network host parrotsec/metasploit```

local image from Dockerfile
```docker run -ti -network host metasploit```

## Start with persistence
changes are preserved

public image from docker cloud
```docker run -ti -v metasploit:/ --network host parrotsec/metasploit```

local image from Dockerfile
```docker run -ti -v metasploit:/ --network host metasploit```
