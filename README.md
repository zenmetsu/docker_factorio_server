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

Start the server in interactive mode for debugging. The game isn't saved.

```
docker run --rm -it -P dtandersen/factorio
```

* ```--rm``` - Remove container after stopping
* ```-it``` - Interactive mode, i.e. you can see the console
* ```-P``` - Expose all ports.

## Usage

Normally the server runs as a daemon and a configuration file is specified. Volumes are mounted for saves and mods.

Create ```server-config.json``` and modify it to your liking.

```
docker run -d -P \
  -v /path/to/server-config.json:/opt/factorio/data/server-config.json \
  -v /path/to/saves:/opt/factorio/saves \
  -v /path/to/mods:/opt/factorio/mods \
  --name factorio \
  dtandersen/factorio
```

* ```-d``` - Start the server as a daemon.
* ```-P``` - Expose all ports.
* ```-v``` - Mount volumes for config, mods, and saves.
* ```--name``` - Give the container a name (otherwise it'll be random).

## Saves

The first time the server is started a new map is generated and saved as ```save.zip```. On subsequent runs the newest save is used. To load an old save ```touch save.zip``` and restart the server.

## Mods

Copy them into the mods folder and restart the server.

## Start/Stopping

Assuming the server is named ```factorio```, to stop the server:

```
docker stop factorio
```

To restart the server:

```
docker start factorio
```

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
