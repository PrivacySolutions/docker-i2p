docker-i2p
===========

This docker file will download I2P from deb.i2p2.no and install it into a container.

This script will install the current I2P version released when you build the docker image.

How to install and run
=======================

```
# cd docker-i2p
# docker build -t i2p .
# docker run -p 7657:7657 i2p
```

Then the console should be accessable from your docker server!

Persistent Storage
===================

This is how I run it myself, with the -p I "map" the TCP port to the docker server, and with the 
-v I added persistent storage.


```

docker run -p 7657:7657 -v /data/docker-persistent/i2p/config:/var/lib/i2p/i2p-config:rw meeh/i2p:v1

```


