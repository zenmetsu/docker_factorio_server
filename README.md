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

* Automatically takes latest save or autosave when restarting the container.
* Volumes for saves and mods
* Set autosave interval and number of saves.
* Enable/disable the no-auto-pause option.
* Enable/disable console commands in game.
* Based on Alpine Linux.

# How to use this image?

## Quick Start

Create ```server-config.json``` and modify it to your liking. Now run:

```
docker run -d -P \
  -v /path/to/server-config.json:/opt/factorio/data/server-config.json \
  -v /path/to/saves:/opt/factorio/saves \
  -v /path/to/mods:/opt/factorio/mods \
  --name factorio
  dtandersen/factorio
```

```-d``` starts the server as a daemon. ```-P``` exposes all ports. The ```-v``` options mount volumes on the local file system to the container for config, mods, and saves. ```dtandersen/factorio``` is the docker images name. ```--name``` gives the container a name instead of a random name.

The server should start and create ```/path/to/saves/save.zip```. This save is used when the server is restarted.

## Volumes

* /opt/factorio/saves - save files
* /opt/factorio/mods - save files
* /opt/factorio/data/server-config.json - config file

## Ports

* 34197/udp - game data
* 27015/tcp - rcon

### Logs

Sometimes it's useful to see the logs of a running container:

```
docker exec -it factorio tail -f /opt/factorio/factorio-current.log
```

# Credits

Based on [Zopanix' Factorio Server](https://github.com/zopanix/docker_factorio_server).
