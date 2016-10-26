![Stars](https://img.shields.io/docker/stars/dtandersen/factorio.svg)
![Pulls](https://img.shields.io/docker/pulls/dtandersen/factorio.svg)

# Supported tags and respective `Dockerfile` links

* `0.14.16`, `latest` [(0.14.16/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/0.14.16/Dockerfile)
* `0.14.14` [(0.14.14/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/0.14.14/Dockerfile)
* `0.12.32` [(0.12.32/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/dt_0.12.32/Dockerfile)
* `0.12.31` [(0.12.31/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/dt_0.12.31/Dockerfile)
* `0.12.30` [(0.12.30/Dockerfile)](https://github.com/dtandersen/docker_factorio_server/blob/dt_0.12.30/Dockerfile)

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

Begin by running the server to create the necessary folder structure and configuration files. For this example we'll use ```/tmp/factorio``` to store our data.

```
docker run -d -P -v /tmp/factorio:/factorio --name factorio dtandersen/factorio
```

Here is an explanation of the options:

* ```--d``` - Run as a daemon (detached).
* ```-P``` - Expose all ports.
* ```-v``` - Mount ```/tmp/factorio``` on the local file system to ```/factorio``` in the container.
* ```--name``` - Name the container ```factorio``` (otherwise it has a random name).

Check the logs to see what happened:

```
docker logs factorio
```

Stop the server:

```docker stop factorio```

Now there's a ```server-settings.json``` file in the folder ```/tmp/factorio/config```. Modify this to your liking.

Restart the server:

```docker start factorio```

Try to connect to the server. Check the logs if it isn't working.

## Saves

A new map (```save.zip```) is generated the first time the server is started. On subsequent runs the newest save is used. 

To load an old save ```touch save.zip``` and restart the server.

To generate a new map delete all of the saves and restart the server.

For custom map settings edit ```map-gen-settings.json``` in ```/tmp/factorio/config```. Then generate a new map.

## Mods

Copy the mods into the mods folder and restart the server.

## Volumes

The server has only one volume: ```/factorio```. Under this folder there are folders for ```/saves```, ```/mods```, and ```/config```.

* ```/factorio```
** ```/config```
*** ```server-settings.json```
*** ```map-gen-settings.json```
** ```/mods```
** ```/saves```

## Ports

* ```34197/udp``` - Client (required)
* ```27015/tcp``` - Remote console (optional)

# Credits

Based on [Zopanix' Factorio Server](https://github.com/zopanix/docker_factorio_server).
