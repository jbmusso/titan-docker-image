# titan docker image

Image that contains only Titan.

## Start titan

To start titan, you must use:

```
docker run titan /opt/titan/bin/start.sh
```

*Why? Because Titan is a daemon and the container will stop if you use just the `titan.sh start` command.*

## Use titan command line

To use titan command line, you must use:

```
docker run titan /opt/titan/bin/titan.sh status
```
