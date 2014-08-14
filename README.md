docker-i2p
===========

This docker file will download I2P from deb.i2p2.no and install it into a container.

How to install and run
=======================

```
# cd docker-i2p
# docker build -t i2p .
# docker run -p 7657:7657 i2p
```

Then the console should be accessable from your docker server!


