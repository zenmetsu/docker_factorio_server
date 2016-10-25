# Supported tags and respective `Dockerfile` links

* `0.14.14` [(0.14.14/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/0.14.14/Dockerfile)
* `0.12.32`, `latest` [(0.12.32/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/dt_0.12.32/Dockerfile)
* `0.12.31` [(0.12.31/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/dt_0.12.31/Dockerfile)
* `0.12.30` [(0.12.30/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/dt_0.12.30/Dockerfile)

[![](https://imagelayers.io/badge/dtandersen/factorio:latest.svg)](https://imagelayers.io/?images=dtandersen/factorio:latest 'Get your own badge on imagelayers.io')

# What is Factorio?

[Factorio](https://www.factorio.com) is a game in which you build and maintain factories.

You will be mining resources, researching technologies, building infrastructure, automating production and fighting enemies. Use your imagination to design your factory, combine simple elements into ingenious structures, apply management skills to keep it working and finally protect it from the creatures who don't really like you.

The game is very stable and optimized for building massive factories. You can create your own maps, write mods in Lua or play with friends via Multiplayer.

NOTE: This is only the server. The game is available on [Steam](http://store.steampowered.com/app/427520/).

# Features

* Configurable via ```server-config.json```.
* Automatically loads the last save.
* Volumes for saves and mods.
* Small size. Based on Alpine Linux.

# How to use this image?

## Quick Start

Create ```server-config.json``` and modify it to your liking.

Now start the server:

```
docker run -d -P \
  -v /path/to/server-config.json:/opt/factorio/data/server-config.json \
  -v /path/to/saves:/opt/factorio/saves \
  -v /path/to/mods:/opt/factorio/mods \
  --name factorio \
  dtandersen/factorio
```

If you're wondering what all these options are:

* ```-d``` - Start the server as a daemon.
* ```-P``` - Expose all ports.
* ```-v``` - Mount volumes for config, mods, and saves.
* ```--name``` - Give the container a name (otherwise it'll be random).
* ```dtandersen/factorio``` - The Docker image name.

The server should start and create ```/path/to/saves/save.zip```. The save remains if the server stops, since the save folder is mounted as a volume.

## Stopping the Server

Assuming the server is named ```factorio```, run:

```
docker stop factorio
```

## Saves

If there are no saves when the server starts, then a new map is generated and saved as ```save.zip```.

Otherwise, the most recent ZIP file in the saves folder is used. To load an old save ```touch save.zip``` and restart the server.

## Mods

Copy them into the mods folder.

## Volumes

* ```/opt/factorio/saves``` - Saves (recommened)
* ```/opt/factorio/mods``` - Mods (optional)
* ```/opt/factorio/data/server-config.json``` - Configuration (recommended)

## Ports

* ```34197/udp``` - Client (required)
* ```27015/tcp``` - Remote console (optional)

## Logs

Sometimes it's useful to see the logs of a running container:

```
docker exec -it factorio tail -f /opt/factorio/factorio-current.log
```

# Credits

Based on [Zopanix' Factorio Server](https://github.com/zopanix/docker_factorio_server).
